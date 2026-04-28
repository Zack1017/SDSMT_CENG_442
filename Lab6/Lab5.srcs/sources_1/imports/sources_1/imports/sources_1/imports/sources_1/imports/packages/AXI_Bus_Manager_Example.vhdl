library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity entity_name is
	generic (
		-- Users can add generic parameters here

		-- User parameters ends
		C_M_TARGET_SLAVE_BASE_ADDR : std_logic_vector	:= x"00000000"; -- Base address of targeted slave
		C_M_AXI_BURST_LEN	     : integer	:= 1; -- Burst Length. Supports 1, 2, 4, 8, 16, 32, 64, 128, 256 burst lengths
		C_M_AXI_ID_WIDTH	     : integer	:= 1; -- Thread ID Width
		C_M_AXI_ADDR_WIDTH	   : integer	:= 32; -- Width of Address Bus
		C_M_AXI_DATA_WIDTH	   : integer	:= 32; -- Width of Data Bus
		C_M_AXI_AWUSER_WIDTH   : integer	:= 0; -- Width of User Write Address Bus
		C_M_AXI_ARUSER_WIDTH   : integer	:= 0; -- Width of User Read Address Bus
		C_M_AXI_WUSER_WIDTH	   : integer	:= 0; -- Width of User Write Data Bus
		C_M_AXI_RUSER_WIDTH	   : integer	:= 0; -- Width of User Read Data Bus
		C_M_AXI_BUSER_WIDTH	   : integer	:= 0  -- Width of User Response Bus
    );
	port (
		-- Users can add ports here. These are SUGGESTED user ports.
		Start_read	 : in std_logic;  -- Initiate AXI read transaction
    Read_address : in std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0); -- address to read from
 		Read_Done	: out std_logic; -- Asserts when transaction is complete
    Read_Data : out std_logic_vector(0 to C_M_AXI_DATA_WIDTH*C_M_AXI_BURST_LEN - 1); -- Data that was read (modify as needed)
		Error	: out std_logic; -- Asserts when ERROR is detected
		-- User ports ends
    -- Global AXI ports
		M_AXI_ACLK	: in std_logic;    -- Global Clock Signal.
		M_AXI_ARESETN	: in std_logic;  -- Global Reset Singal. This Signal is Active Low
    -- AXI Write Address Channel
		M_AXI_AWID	: out std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0); -- Master Interface Write Address ID
		M_AXI_AWADDR	: out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0); -- Master Interface Write Address
		M_AXI_AWLEN	: out std_logic_vector(7 downto 0); -- Burst length. The burst length gives the exact number of transfers in a burst
		M_AXI_AWSIZE	: out std_logic_vector(2 downto 0); -- Burst size. This signal indicates the size of each transfer in the burst
		M_AXI_AWBURST	: out std_logic_vector(1 downto 0); -- Burst type. The burst type and the size information, determine how the address for each transfer within the burst is calculated.
		M_AXI_AWLOCK	: out std_logic; -- Lock type. Provides additional information about the atomic characteristics of the transfer. 
		M_AXI_AWCACHE	: out std_logic_vector(3 downto 0); -- Memory type. This signal indicates how transactions are required to progress through a system.
		M_AXI_AWPROT	: out std_logic_vector(2 downto 0); -- Protection type. This signal indicates the privilege and security level of the transaction, and whether the transaction is a data access or an instruction access.
		M_AXI_AWQOS	: out std_logic_vector(3 downto 0); -- Quality of Service, QoS identifier sent for each write transaction.
		M_AXI_AWUSER	: out std_logic_vector(C_M_AXI_AWUSER_WIDTH-1 downto 0); -- Optional User-defined signal in the write address channel.
		M_AXI_AWVALID	: out std_logic; -- Write address valid. This signal indicates that the channel is signaling valid write address and control information.
		M_AXI_AWREADY	: in std_logic; -- Write address ready. This signal indicates that the slave is ready to accept an address and associated control signals
    -- AXI Write Data Channel
		M_AXI_WDATA	: out std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0); -- Master Interface Write Data.
		M_AXI_WSTRB	: out std_logic_vector(C_M_AXI_DATA_WIDTH/8-1 downto 0); -- Write strobes. This signal indicates which byte lanes hold valid data. There is one write strobe bit for each eight bits of the write data bus.
		M_AXI_WLAST	: out std_logic; -- Write last. This signal indicates the last transfer in a write burst.
		M_AXI_WUSER	: out std_logic_vector(C_M_AXI_WUSER_WIDTH-1 downto 0); -- Optional User-defined signal in the write data channel.
		M_AXI_WVALID	: out std_logic; -- Write valid. This signal indicates that valid write data and strobes are available
		M_AXI_WREADY	: in std_logic; -- Write ready. This signal indicates that the slave can accept the write data.
    -- AXI Write Response Channel
		M_AXI_BID	: in std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0); -- Master Interface Write Response.
		M_AXI_BRESP	: in std_logic_vector(1 downto 0); -- Write response. This signal indicates the status of the write transaction.
		M_AXI_BUSER	: in std_logic_vector(C_M_AXI_BUSER_WIDTH-1 downto 0); -- Optional User-defined signal in the write response channel
		M_AXI_BVALID	: in std_logic; -- Write response valid. This signal indicates that the  channel is signaling a valid write response.
		M_AXI_BREADY	: out std_logic; -- Response ready. This signal indicates that the master can accept a write response.
    -- AXI Read Address Channel
		M_AXI_ARID	: out std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0); -- Master Interface Read Address.
		M_AXI_ARADDR	: out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0); -- Read address. This signal indicates the initial address of a read burst transaction.
		M_AXI_ARLEN	: out std_logic_vector(7 downto 0); -- Burst length. The burst length gives the exact number of transfers in a burst
		M_AXI_ARSIZE	: out std_logic_vector(2 downto 0); -- Burst size. This signal indicates the size of each transfer in the burst
		M_AXI_ARBURST	: out std_logic_vector(1 downto 0); -- Burst type. The burst type and the size information, determine how the address for each transfer within the burst is calculated.
		M_AXI_ARLOCK	: out std_logic; -- Lock type. Provides additional information about the atomic characteristics of the transfer.
		M_AXI_ARCACHE	: out std_logic_vector(3 downto 0); -- Memory type. This signal indicates how transactions are required to progress through a system.
		M_AXI_ARPROT	: out std_logic_vector(2 downto 0); -- Protection type. This signal indicates the privilege and security level of the transaction, and whether the transaction is a data access or an instruction access.
		M_AXI_ARQOS	: out std_logic_vector(3 downto 0); -- Quality of Service, QoS identifier sent for each read transaction
		M_AXI_ARUSER	: out std_logic_vector(C_M_AXI_ARUSER_WIDTH-1 downto 0); -- Optional User-defined signal in the read address channel.
		M_AXI_ARVALID	: out std_logic; -- Write address valid. This signal indicates that the channel is signaling valid read address and control information
		M_AXI_ARREADY	: in std_logic; -- Read address ready. This signal indicates that the slave is ready to accept an address and associated control signals
    -- AXI Read Data Channel
		M_AXI_RID	: in std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0); -- Read ID tag. This signal is the identification tag for the read data group of signals generated by the slave.
		M_AXI_RDATA	: in std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0); -- Master Read Data
		M_AXI_RRESP	: in std_logic_vector(1 downto 0); -- Read response. This signal indicates the status of the read transfer
		M_AXI_RLAST	: in std_logic; -- Read last. This signal indicates the last transfer in a read burst
		M_AXI_RUSER	: in std_logic_vector(C_M_AXI_RUSER_WIDTH-1 downto 0); -- Optional User-defined signal in the read address channel.
		M_AXI_RVALID	: in std_logic; -- Read valid. This signal indicates that the channel is signaling the required read data.
		M_AXI_RREADY	: out std_logic; -- Read ready. This signal indicates that the master can accept the read data and response information.
        
        -- Add to the entity port list
        RSTATE_Q : in  std_logic_vector(1 downto 0);  -- "00"=IDLE, "01"=AR_REQ, "10"=WAIT, "11"=DONE
        RSTATE_D : out std_logic_vector(1 downto 0)  -- next-state back to your 2-bit DFF

    
    );
end entity_name;

architecture implementation of entity_name is
  -- State encodings
  constant RIDLE : std_logic_vector(1 downto 0) := "00";
  constant RADDR : std_logic_vector(1 downto 0) := "01";
  constant RWAIT : std_logic_vector(1 downto 0) := "10";
  constant RDONE : std_logic_vector(1 downto 0) := "11";

  -- Convenience
  constant BURST_SINGLE : std_logic_vector(7 downto 0) := (others => '0'); -- len=0 => 1 beat

  -- Handshake event (used for Read_Done/Error)
  signal r_beat_accept : std_logic;
  signal r_ok          : std_logic;
begin
  ---------------------------------------------------------------------------
  -- Write channels: tie off (unused)
  ---------------------------------------------------------------------------
  M_AXI_AWID    <= (others => '0');
  M_AXI_AWADDR  <= (others => '0');
  M_AXI_AWLEN   <= (others => '0');
  M_AXI_AWSIZE  <= "010";
  M_AXI_AWBURST <= "01";
  M_AXI_AWLOCK  <= '0';
  M_AXI_AWCACHE <= "0011";
  M_AXI_AWPROT  <= "000";
  M_AXI_AWQOS   <= (others => '0');
  M_AXI_AWUSER  <= (others => '0');
  M_AXI_AWVALID <= '0';

  M_AXI_WDATA   <= (others => '0');
  M_AXI_WSTRB   <= (others => '0');
  M_AXI_WLAST   <= '0';
  M_AXI_WUSER   <= (others => '0');
  M_AXI_WVALID  <= '0';

  M_AXI_BREADY  <= '1';

  ---------------------------------------------------------------------------
  -- Read Address Channel (combinational)
  ---------------------------------------------------------------------------
  -- Base + user address
  M_AXI_ARADDR  <= std_logic_vector(unsigned(C_M_TARGET_SLAVE_BASE_ADDR) + unsigned(Read_address));
  -- Protocol constants
  M_AXI_ARID    <= (others => '0');
  M_AXI_ARLEN   <= BURST_SINGLE;  -- single beat
  M_AXI_ARSIZE  <= "010";         -- 4 bytes
  M_AXI_ARBURST <= "01";          -- INCR
  M_AXI_ARLOCK  <= '0';
  M_AXI_ARCACHE <= "0011";
  M_AXI_ARPROT  <= "000";
  M_AXI_ARQOS   <= (others => '0');
  M_AXI_ARUSER  <= (others => '0');

  -- ARVALID is high only in the AR_REQ state
  M_AXI_ARVALID <= '1' when RSTATE_Q = RADDR else '0';

  ---------------------------------------------------------------------------
  -- Read Data Channel (combinational)
  ---------------------------------------------------------------------------
  -- Present RREADY only while waiting for data
  M_AXI_RREADY <= '1' when RSTATE_Q = RWAIT else '0';

  -- Handshake + status
  r_beat_accept <= '1' when (M_AXI_RVALID = '1' and M_AXI_RREADY = '1') else '0';
  r_ok          <= '1' when (M_AXI_RRESP = "00") else '0';

  -- User outputs:
  -- Data is driven combinationally from bus (IR should latch on Read_Done)
  Read_Data <= M_AXI_RDATA &  -- if C_M_AXI_BURST_LEN>1, widen here; single beat uses low slice
               (others => '0') when C_M_AXI_DATA_WIDTH*C_M_AXI_BURST_LEN > C_M_AXI_DATA_WIDTH else
               M_AXI_RDATA;

  -- One-cycle pulses (combinational "events") - your IR/PC DFFs should use them as enables
  Read_Done <= '1' when (RSTATE_Q = RWAIT and r_beat_accept = '1' and r_ok = '1') else '0';
  Error     <= '1' when (RSTATE_Q = RWAIT and r_beat_accept = '1' and r_ok = '0') else '0';

  ---------------------------------------------------------------------------
  -- Next-state (combinational)
  -- IDLE --Start_read--> RADDR --ARREADY--> RWAIT --(RVALID/RREADY)--> RDONE --> IDLE
  ---------------------------------------------------------------------------
  RSTATE_D <=
      RADDR when (RSTATE_Q = RIDLE and Start_read = '1') else
      RIDLE when (RSTATE_Q = RIDLE) else

      RWAIT when (RSTATE_Q = RADDR and M_AXI_ARREADY = '1') else
      RADDR when (RSTATE_Q = RADDR) else

      RDONE when (RSTATE_Q = RWAIT and r_beat_accept = '1') else
      RWAIT when (RSTATE_Q = RWAIT) else

      RIDLE; -- RSTATE_Q = RDONE

  ---------------------------------------------------------------------------
  -- Read channel side-band (pass-through)
  ---------------------------------------------------------------------------
  -- These inputs are only monitored; no extra logic needed:
  -- M_AXI_ARREADY, M_AXI_RVALID, M_AXI_RRESP, M_AXI_RDATA, M_AXI_RLAST, etc.

end implementation;
