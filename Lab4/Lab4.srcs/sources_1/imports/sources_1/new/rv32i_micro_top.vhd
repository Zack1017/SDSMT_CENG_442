library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.control_word_package.all;

entity rv32i_micro_top is
  generic (
    USE_APB : boolean := true
  );
  port (
    -- Clock / Reset
    clk   : in  std_logic;
    rst_n : in  std_logic;

    -- Run control
    start : in  std_logic;

    -- ================= AXI Read-only (Instruction fetch) =================
    -- Read address channel
    ARREADY_i  : in  std_logic;
    ARADDR_i   : out std_logic_vector(31 downto 0);
    ARVALID_i  : out std_logic;
    -- Read data channel
    RVALID_i   : in  std_logic;
    RDATA_i    : in  std_logic_vector(31 downto 0);

    -- ============================= APB (optional; can be tied off) =========================
    PREADY     : in  std_logic := '0';
    PRDATA     : in  std_logic_vector(31 downto 0) := (others => '0');
    PADDR      : out std_logic_vector(31 downto 0);
    PSEL       : out std_logic;
    PENABLE    : out std_logic;
    PWRITE     : out std_logic;
    PWDATA     : out std_logic_vector(31 downto 0);

    -- ================= AXI4-Lite (Data) for Load/Store Unit =================
    -- READ
    d_ARREADY  : in  std_logic;
    d_ARADDR   : out std_logic_vector(31 downto 0);
    d_ARVALID  : out std_logic;
    d_RVALID   : in  std_logic;
    d_RREADY   : out std_logic;
    d_RDATA    : in  std_logic_vector(31 downto 0);
    -- WRITE
    d_AWREADY  : in  std_logic;
    d_AWADDR   : out std_logic_vector(31 downto 0);
    d_AWVALID  : out std_logic;
    d_WREADY   : in  std_logic;
    d_WDATA    : out std_logic_vector(31 downto 0);
    d_WSTRB    : out std_logic_vector(3 downto 0);
    d_WVALID   : out std_logic;
    d_BVALID   : in  std_logic;
    d_BREADY   : out std_logic
  );
end rv32i_micro_top;

architecture rtl of rv32i_micro_top is

  ----------------------------------------------------------------------------
  -- COMPONENTS (declare the three used blocks)
  ----------------------------------------------------------------------------
  component fetch_unit
    generic ( USE_APB : boolean := true );
    port (
      state_q       : in  std_logic_vector(1 downto 0);
      state_1       : out std_logic_vector(1 downto 0);

      start         : in  std_logic;
      pc_i          : in  std_logic_vector(31 downto 0);

      -- AXI read (inst)
      ARREADY       : in  std_logic;
      RVALID        : in  std_logic;
      RDATA         : in  std_logic_vector(31 downto 0);
      ARADDR        : out std_logic_vector(31 downto 0);
      ARVALID       : out std_logic;

      -- APB read (optional)
      PREADY        : in  std_logic;
      PRDATA        : in  std_logic_vector(31 downto 0);
      PADDR         : out std_logic_vector(31 downto 0);
      PSEL          : out std_logic;
      PENABLE       : out std_logic;
      PWRITE        : out std_logic;
      PWDATA        : out std_logic_vector(31 downto 0);

      data_from_bus : out std_logic_vector(31 downto 0);
      IRLEN         : out std_logic;
      PCIE          : out std_logic;
      DONE          : out std_logic;

      state_d       : out std_logic_vector(1 downto 0)
    );
  end component;

  component instruct_decoder
    port (
      inst    : in  std_logic_vector(31 downto 0);
      cw      : out control_word;
      illegal : out std_logic
    );
  end component;

  component data_path
    port (
      control      : in  control_word;
      pc_val       : out std_logic_vector(31 downto 0);

      -- NEW LSU ports
      ls_addr      : out std_logic_vector(31 downto 0);
      store_data   : out std_logic_vector(31 downto 0);
      store_wstrb  : out std_logic_vector(3 downto 0);
      start_load   : out std_logic;
      start_store  : out std_logic;
      load_data    : in  std_logic_vector(31 downto 0);
      ls_ready     : in  std_logic;
      mem_busy     : out std_logic
    );
  end component;

  component ls_unit
    port (
      clk, rst       : in  std_logic;
      start_load     : in  std_logic;
      start_store    : in  std_logic;
      addr_in        : in  std_logic_vector(31 downto 0);
      wdata_in       : in  std_logic_vector(31 downto 0);
      wstrb_in       : in  std_logic_vector(3 downto 0);
      rdata_out      : out std_logic_vector(31 downto 0);
      ls_ready       : out std_logic;
      -- AXI4-Lite READ
      ARVALID        : out std_logic;
      ARADDR         : out std_logic_vector(31 downto 0);
      ARREADY        : in  std_logic;
      RVALID         : in  std_logic;
      RREADY         : out std_logic;
      RDATA          : in  std_logic_vector(31 downto 0);
      -- AXI4-Lite WRITE
      AWVALID        : out std_logic;
      AWADDR         : out std_logic_vector(31 downto 0);
      AWREADY        : in  std_logic;
      WVALID         : out std_logic;
      WDATA          : out std_logic_vector(31 downto 0);
      WSTRB          : out std_logic_vector(3 downto 0);
      WREADY         : in  std_logic;
      BVALID         : in  std_logic;
      BREADY         : out std_logic
    );
  end component;

  ----------------------------------------------------------------------------
  -- SIGNALS
  ----------------------------------------------------------------------------
  signal rst        : std_logic;

  -- Fetch/IR/state
  signal state_q    : std_logic_vector(1 downto 0) := (others => '0');
  signal state_d    : std_logic_vector(1 downto 0);
  signal fetch_data : std_logic_vector(31 downto 0);
  signal ir         : std_logic_vector(31 downto 0) := (others => '0');
  signal irlen      : std_logic;
  signal pc_inc     : std_logic;
  signal fetch_done : std_logic;

  -- Decode/control
  signal cw_dec     : control_word;
  signal cw_comb    : control_word;
  signal illegal_i  : std_logic;
  signal dec_isLOAD  : std_logic;
  signal dec_isSTORE : std_logic;

  -- PC from datapath
  signal pc_cur     : std_logic_vector(31 downto 0);

  -- LSU wires
  signal ls_addr_s, ls_wdata_s, ls_rdata_s : std_logic_vector(31 downto 0);
  signal ls_wstrb_s                        : std_logic_vector(3 downto 0);
  signal start_load_s, start_store_s       : std_logic;
  signal ls_ready_s, mem_busy_s            : std_logic;

begin
  -- Active-high internal reset
  rst <= not rst_n;

  ----------------------------------------------------------------------------
  -- FETCH UNIT
  ----------------------------------------------------------------------------
  u_fetch: fetch_unit
    generic map ( USE_APB => USE_APB )
    port map (
      state_q       => state_q,
      state_1       => open,

      start         => start,
      pc_i          => pc_cur,

      -- AXI (inst)
      ARREADY       => ARREADY_i,
      RVALID        => RVALID_i,
      RDATA         => RDATA_i,
      ARADDR        => ARADDR_i,
      ARVALID       => ARVALID_i,

      -- APB optional
      PREADY        => PREADY,
      PRDATA        => PRDATA,
      PADDR         => PADDR,
      PSEL          => PSEL,
      PENABLE       => PENABLE,
      PWRITE        => PWRITE,
      PWDATA        => PWDATA,

      data_from_bus => fetch_data,
      IRLEN         => irlen,
      PCIE          => pc_inc,
      DONE          => fetch_done,

      state_d       => state_d
    );

  -- Single small sequential island for IR/state (you can keep your version)
  process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        ir      <= (others => '0');
        state_q <= (others => '0');
      else
        if irlen = '1' then
          ir <= fetch_data;
        end if;
        state_q <= state_d;
      end if;
    end if;
  end process;

  ----------------------------------------------------------------------------
  -- DECODE
  ----------------------------------------------------------------------------
  u_dec: instruct_decoder
    port map (
      inst    => ir,
      cw      => cw_dec,
      illegal => illegal_i
    );

  ----------------------------------------------------------------------------
  -- CONTROL WORD COMPLETION + PC stall on LSU busy
  ----------------------------------------------------------------------------
  cw_comb           <= cw_dec;
  cw_comb.clk       <= clk;
  cw_comb.rst       <= rst;
  cw_comb.PCie      <= pc_inc and not mem_busy_s;  -- <<< stall fetch during LSU op

  ----------------------------------------------------------------------------
  -- DATAPATH (now exports LSU wiring)
  ----------------------------------------------------------------------------
  u_dp: entity work.data_path
  port map (
    control      => cw_comb,
    pc_val       => pc_cur,
    -- NEW
    funct3       => ir(14 downto 12),
    -- LSU
    ls_addr      => ls_addr_s,
    store_data   => ls_wdata_s,
    store_wstrb  => ls_wstrb_s,
    start_load   => start_load_s,
    start_store  => start_store_s,
    load_data    => ls_rdata_s,
    ls_ready     => ls_ready_s,
    mem_busy     => mem_busy_s,
    isLOAD  => dec_isLOAD,
    isSTORE => dec_isSTORE
  );


  ----------------------------------------------------------------------------
  -- LOAD/STORE UNIT (AXI4-Lite master: d_* ports)
  ----------------------------------------------------------------------------
  u_lsu: ls_unit
    port map (
      clk         => clk,
      rst         => rst,

      start_load  => start_load_s,
      start_store => start_store_s,

      addr_in     => ls_addr_s,
      wdata_in    => ls_wdata_s,
      wstrb_in    => ls_wstrb_s,

      rdata_out   => ls_rdata_s,
      ls_ready    => ls_ready_s,

      -- AXI READ
      ARVALID     => d_ARVALID,
      ARADDR      => d_ARADDR,
      ARREADY     => d_ARREADY,
      RVALID      => d_RVALID,
      RREADY      => d_RREADY,
      RDATA       => d_RDATA,

      -- AXI WRITE
      AWVALID     => d_AWVALID,
      AWADDR      => d_AWADDR,
      AWREADY     => d_AWREADY,
      WVALID      => d_WVALID,
      WDATA       => d_WDATA,
      WSTRB       => d_WSTRB,
      WREADY      => d_WREADY,
      BVALID      => d_BVALID,
      BREADY      => d_BREADY
    );

end rtl;
