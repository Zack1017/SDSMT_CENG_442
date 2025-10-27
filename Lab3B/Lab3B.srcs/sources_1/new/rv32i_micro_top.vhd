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

    -- AXI (Instruction fetch, read-only)
    ARREADY  : in  std_logic;
    ARADDR   : out std_logic_vector(31 downto 0);
    ARVALID  : out std_logic;
    RVALID   : in  std_logic;
    RDATA    : in  std_logic_vector(31 downto 0);

    -- APB (optional / can be left unconnected)
    PREADY   : in  std_logic := '0';
    PRDATA   : in  std_logic_vector(31 downto 0) := (others => '0');
    PADDR    : out std_logic_vector(31 downto 0);
    PSEL     : out std_logic;
    PENABLE  : out std_logic;
    PWRITE   : out std_logic;
    PWDATA   : out std_logic_vector(31 downto 0)
  );
end rv32i_micro_top;

architecture rtl of rv32i_micro_top is

  ----------------------------------------------------------------------------
  -- Components
  ----------------------------------------------------------------------------
  component fetch_unit
    generic ( USE_APB : boolean := true );
    port (
      state_q       : in  std_logic_vector(1 downto 0);
      state_1       : out std_logic_vector(1 downto 0);

      start         : in  std_logic;
      pc_i          : in  std_logic_vector(31 downto 0);

      -- AXI read
      ARREADY       : in  std_logic;
      RVALID        : in  std_logic;
      RDATA         : in  std_logic_vector(31 downto 0);
      ARADDR        : out std_logic_vector(31 downto 0);
      ARVALID       : out std_logic;

      -- APB read
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
      control : in  control_word;
      pc_val  : out std_logic_vector(31 downto 0)
    );
  end component;

  ----------------------------------------------------------------------------
  -- Signals
  ----------------------------------------------------------------------------
  signal rst        : std_logic;

  -- Micro state
  signal state_q    : std_logic_vector(1 downto 0) := (others => '0');
  signal state_d    : std_logic_vector(1 downto 0);

  -- Instruction path
  signal fetch_data : std_logic_vector(31 downto 0);
  signal ir         : std_logic_vector(31 downto 0) := (others => '0');
  signal irlen      : std_logic;         -- pulse from fetch_unit
  signal pc_inc     : std_logic;         -- pulse from fetch_unit
  signal fetch_done : std_logic;

  -- Decode / control
  signal cw_dec     : control_word;
  signal cw_comb    : control_word;
  signal illegal_i  : std_logic;

  -- PC from datapath
  signal pc_cur     : std_logic_vector(31 downto 0);

begin
  -- Active-high internal reset
  rst <= not rst_n;

  ----------------------------------------------------------------------------
  -- FETCH UNIT (purely combinational at top level; internals may be sequential)
  ----------------------------------------------------------------------------
  u_fetch: fetch_unit
    generic map ( USE_APB => USE_APB )
    port map (
      state_q       => state_q,
      state_1       => open,

      start         => start,
      pc_i          => pc_cur,

      -- AXI
      ARREADY       => ARREADY,
      RVALID        => RVALID,
      RDATA         => RDATA,
      ARADDR        => ARADDR,
      ARVALID       => ARVALID,

      -- APB
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

  ----------------------------------------------------------------------------
  -- SINGLE SEQUENTIAL PROCESS:
  --   - Latch instruction when IRLEN pulses
  --   - Advance FSM state
  ----------------------------------------------------------------------------
  seq_regs: process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        ir      <= (others => '0');
        state_q <= (others => '0');
      else
        -- IR latch (pulse-based enable)
        if irlen = '1' then
          ir <= fetch_data;
        end if;
        -- FSM state register
        state_q <= state_d;
      end if;
    end if;
  end process;

  ----------------------------------------------------------------------------
  -- DECODE (concurrent)
  ----------------------------------------------------------------------------
  u_dec: instruct_decoder
    port map (
      inst    => ir,
      cw      => cw_dec,
      illegal => illegal_i
    );

  ----------------------------------------------------------------------------
  -- CONTROL WORD COMPLETION (concurrent)
  ----------------------------------------------------------------------------
  cw_comb           <= cw_dec;
  cw_comb.clk       <= clk;
  cw_comb.rst       <= rst;
  cw_comb.PCie      <= pc_inc; -- drive PC increment from fetch_unit handshake

  ----------------------------------------------------------------------------
  -- DATAPATH (concurrent instance)
  ----------------------------------------------------------------------------
  u_dp: data_path
    port map (
      control => cw_comb,
      pc_val  => pc_cur
    );

end rtl;
