library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Xilinx FF primitive
library UNISIM;
use UNISIM.VComponents.all;

entity ls_unit is
  port (
    -- Clock / Reset
    clk      : in  std_logic;
    rst      : in  std_logic;

    -- Control from datapath
    start_load   : in  std_logic;
    start_store  : in  std_logic;
    addr_in      : in  std_logic_vector(31 downto 0);
    wdata_in     : in  std_logic_vector(31 downto 0);
    wstrb_in     : in  std_logic_vector(3 downto 0);

    -- Back to datapath
    rdata_out    : out std_logic_vector(31 downto 0);
    ls_ready     : out std_logic;

    -- AXI4-Lite Master (data bus)
    -- Read Address
    ARVALID      : out std_logic;
    ARADDR       : out std_logic_vector(31 downto 0);
    ARREADY      : in  std_logic;

    -- Read Data
    RVALID       : in  std_logic;
    RREADY       : out std_logic;
    RDATA        : in  std_logic_vector(31 downto 0);

    -- Write Address
    AWVALID      : out std_logic;
    AWADDR       : out std_logic_vector(31 downto 0);
    AWREADY      : in  std_logic;

    -- Write Data
    WVALID       : out std_logic;
    WDATA        : out std_logic_vector(31 downto 0);
    WSTRB        : out std_logic_vector(3 downto 0);
    WREADY       : in  std_logic;

    -- Write Response
    BVALID       : in  std_logic;
    BREADY       : out std_logic
  );
end ls_unit;

architecture structural of ls_unit is
  --------------------------------------------------------------------------
  -- One-hot FSM encoding
  --------------------------------------------------------------------------
  constant S_IDLE  : std_logic_vector(3 downto 0) := "0001";
  constant S_READ  : std_logic_vector(3 downto 0) := "0010";
  constant S_WRITE : std_logic_vector(3 downto 0) := "0100";
  constant S_WAITB : std_logic_vector(3 downto 0) := "1000";

  -- Registered state and next-state
  signal state_q : std_logic_vector(3 downto 0);
  signal state_d : std_logic_vector(3 downto 0);

  -- Registered address/data so they stay stable during handshakes
  signal araddr_q, awaddr_q : std_logic_vector(31 downto 0);
  signal wdata_q            : std_logic_vector(31 downto 0);
  signal wstrb_q            : std_logic_vector(3 downto 0);

  -- Internal versions of OUT ports (we never read OUTs)
  signal ARVALID_i, RREADY_i, AWVALID_i, WVALID_i, BREADY_i : std_logic;

  -- Latch enable to sample addr/data at start of an op
  signal latch_en : std_logic;
begin
  ----------------------------------------------------------------------------
  -- Combinational next-state and output logic
  ----------------------------------------------------------------------------

  -- Next-state: force IDLE while reset is active (avoids INIT indexing)
  state_d <=
    S_IDLE  when (rst = '1') else
    S_READ  when (state_q = S_IDLE  and start_load  = '1') else
    S_WRITE when (state_q = S_IDLE  and start_store = '1') else
    S_IDLE  when (state_q = S_READ  and RVALID = '1') else
    S_WAITB when (state_q = S_WRITE and AWREADY='1' and WREADY='1') else
    S_IDLE  when (state_q = S_WAITB and BVALID='1') else
    state_q;

  -- Capture command parameters on entry to a transaction
  latch_en <= '1' when (state_q = S_IDLE and (start_load='1' or start_store='1')) else '0';

  -- Output controls (combinational)
  ARVALID_i <= '1' when (state_q = S_READ  and ARREADY='0') else '0';
  RREADY_i  <= '1' when (state_q = S_READ  and RVALID ='1') else '0';
  AWVALID_i <= '1' when (state_q = S_WRITE and AWREADY='0') else '0';
  WVALID_i  <= '1' when (state_q = S_WRITE and WREADY ='0') else '0';
  BREADY_i  <= '1' when (state_q = S_WAITB and BVALID='1') else '0';

  -- Simple pass-through & status
  rdata_out <= RDATA;
  ls_ready  <= '1' when state_q = S_IDLE else '0';

  ----------------------------------------------------------------------------
  -- Flip-flops (process-free), use INIT=>'0' (no indexed generics)
  ----------------------------------------------------------------------------

  -- State registers
  gen_state : for i in 0 to 3 generate
    ff_state : FDRE
      generic map (INIT => '0')
      port map (
        C  => clk,
        CE => '1',
        R  => '0',          -- keep synchronous control via state_d mux above
        D  => state_d(i),
        Q  => state_q(i)
      );
  end generate;

  -- Address/Data/WSTRB registers (latched at op start)
  gen_addr : for i in 0 to 31 generate
    ff_ar : FDRE port map (C=>clk, CE=>latch_en, R=>'0', D=>addr_in(i), Q=>araddr_q(i));
    ff_aw : FDRE port map (C=>clk, CE=>latch_en, R=>'0', D=>addr_in(i), Q=>awaddr_q(i));
    ff_wd : FDRE port map (C=>clk, CE=>latch_en, R=>'0', D=>wdata_in(i), Q=>wdata_q(i));
  end generate;

  gen_wstrb : for i in 0 to 3 generate
    ff_ws : FDRE port map (C=>clk, CE=>latch_en, R=>'0', D=>wstrb_in(i), Q=>wstrb_q(i));
  end generate;

  ----------------------------------------------------------------------------
  -- Tie internal regs to output ports
  ----------------------------------------------------------------------------
  ARADDR  <= araddr_q;
  AWADDR  <= awaddr_q;
  WDATA   <= wdata_q;
  WSTRB   <= wstrb_q;

  ARVALID <= ARVALID_i;
  RREADY  <= RREADY_i;
  AWVALID <= AWVALID_i;
  WVALID  <= WVALID_i;
  BREADY  <= BREADY_i;

end structural;
