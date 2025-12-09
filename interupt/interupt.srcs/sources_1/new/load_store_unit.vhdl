library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity load_store_unit is
	generic (
		C_M_TARGET_SLAVE_BASE_ADDR : std_logic_vector	:= x"C0000000"; -- Base address of targeted slave
		C_M_AXI_BURST_LEN	     : integer	:= 1; -- Burst Length. Supports 1, 2, 4, 8, 16, 32, 64, 128, 256 burst lengths
		C_M_AXI_ID_WIDTH	     : integer	:= 1; -- Thread ID Width
		C_M_AXI_ADDR_WIDTH	   : integer	:= 32; -- Width of Address Bus
		C_M_AXI_DATA_WIDTH	   : integer	:= 32; -- Width of Data Bus
		C_M_AXI_AWUSER_WIDTH   : integer	:= 32; -- Width of User Write Address Bus
		C_M_AXI_ARUSER_WIDTH   : integer	:= 32; -- Width of User Read Address Bus
		C_M_AXI_WUSER_WIDTH	   : integer	:= 32; -- Width of User Write Data Bus
		C_M_AXI_RUSER_WIDTH	   : integer	:= 32; -- Width of User Read Data Bus
		C_M_AXI_BUSER_WIDTH	   : integer	:= 32  -- Width of User Response Bus
    );
	port (
		-- Users can add ports here. These are SUGGESTED user ports.
		Start_load  : in std_logic;  -- is transaction a load command
		Start_store : in std_logic;  -- is transaction a store command
        Address     : in std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0); -- address where data is loaded/stored
        Store_data  : in  std_logic_vector(0 to C_M_AXI_DATA_WIDTH*C_M_AXI_BURST_LEN - 1); -- Data to be sent
        Load_data   : out std_logic_vector(0 to C_M_AXI_DATA_WIDTH*C_M_AXI_BURST_LEN - 1); -- Data that was read (modify as needed)
        L_data_ready : out std_logic;
        Ls_busy     : out std_logic;
		Error	    : out std_logic; -- Asserts when ERROR is detected
		PCle        : out std_logic;
        PCie        : out std_logic;
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
		M_AXI_WACK	: out std_logic; -- Write ready. This signal indicates that the slave can accept the write data.
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
		M_AXI_RREADY	: out std_logic -- Read ready. This signal indicates that the master can accept the read data and response information.
    );
end load_store_unit;

architecture Behavioral of load_store_unit is
    signal ls_latched : std_logic_vector(0 to C_M_AXI_DATA_WIDTH*C_M_AXI_BURST_LEN - 1); 
    signal ldl_en : std_logic; 
    signal ldl_res : std_logic; 
    type load_store_state_t is (
        ls_idle, 
        ls_load_start, 
        ls_store_start, 
        ls_store_data, 
        ls_load_wait, 
        ls_store_wait, 
        ls_load_accept, 
        ls_store_accept,
        ls_exec
    );
    signal current_state : load_store_state_t;
    signal next_state : load_store_state_t;
    signal next_state_final : load_store_state_t;
    signal ls_idle_next : load_store_state_t; 
    signal ls_load_start_next : load_store_state_t; 
    signal ls_load_wait_next : load_store_state_t; 
    signal ls_load_accept_next : load_store_state_t; 
    signal ls_store_start_next : load_store_state_t; 
    signal ls_store_data_next : load_store_state_t; 
    signal ls_store_wait_next : load_store_state_t; 
    signal ls_store_accept_next : load_store_state_t; 
    signal ls_exec_next : load_store_state_t; 
begin
    M_AXI_ARADDR <= Address;
    M_AXI_AWADDR <= Address;
    
    current_state <= next_state_final when rising_edge(M_AXI_ACLK);
    
    next_state_final <= ls_idle when M_AXI_ARESETN = '0' else next_state;
    
    ls_idle_next <= ls_load_start  when Start_load  = '1' else
                    ls_store_start when Start_store = '1'
                    else ls_idle;
    
    --load path
    ls_load_start_next  <= ls_load_wait   when M_AXI_ARREADY = '1' else ls_load_start;
    ls_load_wait_next   <= ls_load_accept when M_AXI_RVALID  = '1' else ls_load_wait;
    ls_load_accept_next <= ls_exec;
    
    --store path
    ls_store_start_next <= ls_store_data when M_AXI_AWREADY = '1'else ls_store_start;
    ls_store_data_next  <= ls_store_wait when M_AXI_WREADY = '1' else ls_store_data;
    ls_store_wait_next  <= ls_store_accept when M_AXI_BVALID = '1' else ls_store_wait;
    ls_store_accept_next <= ls_exec;
    
    ls_exec_next <= ls_idle;
    with current_state select
        next_state <= ls_idle_next when ls_idle, 
                      ls_load_start_next when ls_load_start, 
                      ls_load_wait_next when ls_load_wait, 
                      ls_load_accept_next when ls_load_accept, 
                      ls_store_start_next when ls_store_start, 
                      ls_store_data_next when ls_store_data, 
                      ls_store_wait_next when ls_store_wait, 
                      ls_store_accept_next when ls_store_accept,
                      ls_exec_next when ls_exec,
                      ls_idle when others;
    
    -- load signals
    M_AXI_ARVALID <= '1' when current_state = ls_load_start  else '0';
    M_AXI_RREADY  <= '1' when current_state = ls_load_wait   else '0';
    
    L_data_ready <= M_AXI_RVALID when current_state = ls_load_wait   else 
                             '1' when current_state = ls_load_accept else '0';
    
    ldl_en <= '1' when current_state = ls_load_wait else '0';
    ldl_res <= '1' when current_state = ls_exec else '0';
    
    L_data_latch: entity work.generic_register (behavioral) 
        generic map (N => 32)
        port map (din => M_AXI_RDATA, dout => ls_latched, clk => M_AXI_ACLK, res => ldl_res, en => ldl_en);
    
    Load_data <= ls_latched;

    -- store signals
    M_AXI_WDATA   <= Store_data;
    M_AXI_AWVALID <= '1' when current_state = ls_store_start else '0';
    M_AXI_WVALID  <= '1' when current_state = ls_store_data else '0';
    M_AXI_WLAST   <= '1' when current_state = ls_store_data else '0';
    M_AXI_WACK    <= '1' when current_state = ls_store_data else '0';
    M_AXI_BREADY  <= '1' when current_state = ls_store_data or 
                              current_state = ls_store_wait else '0';
    
    
    
    PCle <= '1' when current_state = ls_exec else '0';
    PCie <= '1' when current_state = ls_exec else '0';
    
    Ls_busy <= '0' when current_state = ls_idle else '1';
    
    M_AXI_AWID	    <= (others => '0');         
    M_AXI_AWLEN	    <= (others => '0');        
    M_AXI_AWSIZE    <= "010";       
    M_AXI_AWBURST   <= "01";        
    M_AXI_AWLOCK    <= '0';                   
    M_AXI_AWCACHE   <= "0000";        
    M_AXI_AWPROT    <= "000";       
    M_AXI_AWQOS     <= (others => '0');        
    M_AXI_AWUSER    <= (others => '0');   
    M_AXI_WSTRB     <= (others => '1');         
    M_AXI_WUSER     <= (others => '0');                     
    M_AXI_ARID      <= (others => '0');
    M_AXI_ARLEN     <= (others => '0');
    M_AXI_ARSIZE    <= "010";
    M_AXI_ARBURST   <= "01";
    M_AXI_ARLOCK    <= '0'; 
    M_AXI_ARCACHE   <= "0000";
    M_AXI_ARPROT    <= "000";
    M_AXI_ARQOS     <= (others => '0');
    M_AXI_ARUSER    <= (others => '0');
    Error <= '0';
end Behavioral;
