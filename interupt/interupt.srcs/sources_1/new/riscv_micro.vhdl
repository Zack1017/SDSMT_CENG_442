library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.RISCV_package.all;

entity riscv_micro is
    generic (
		C_M_TARGET_SLAVE_BASE_ADDR : std_logic_vector:= x"00000000"; 
		C_M_AXI_BURST_LEN: integer	:= 1; 
		C_M_AXI_ID_WIDTH: integer	:= 1; 
		C_M_AXI_ADDR_WIDTH: integer	:= 32; 
		C_M_AXI_DATA_WIDTH: integer	:= 32; 
		C_M_AXI_AWUSER_WIDTH: integer	:= 32; 
		C_M_AXI_ARUSER_WIDTH: integer	:= 32; 
		C_M_AXI_WUSER_WIDTH: integer	:= 32; 
		C_M_AXI_RUSER_WIDTH: integer	:= 32; 
		C_M_AXI_BUSER_WIDTH: integer	:= 32  
    );
    
    
    port (
		CLK	: in std_logic;    -- Global Clock Signal.
		RESET : in std_logic;  -- Global Reset Singal. This Signal is Active High
		INTERRUPT : in std_logic;
		TIMER_INTERRUPT : in std_logic := '0';
		SOFTWARE_INTERRUPT : in std_logic := '0';
		TRAP_CAUSE : out std_logic_vector(3 downto 0);
		
        -- AXI Write Address Channel
		I_M_AXI_AWID	: out std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0); -- Master Interface Write Address ID
		I_M_AXI_AWADDR	: out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0); -- Master Interface Write Address
		I_M_AXI_AWLEN	: out std_logic_vector(7 downto 0); -- Burst length. The burst length gives the exact number of transfers in a burst
		I_M_AXI_AWSIZE	: out std_logic_vector(2 downto 0); -- Burst size. This signal indicates the size of each transfer in the burst
		I_M_AXI_AWBURST	: out std_logic_vector(1 downto 0); -- Burst type. The burst type and the size information, determine how the address for each transfer within the burst is calculated.
		I_M_AXI_AWLOCK	: out std_logic; -- Lock type. Provides additional information about the atomic characteristics of the transfer. 
		I_M_AXI_AWCACHE	: out std_logic_vector(3 downto 0); -- Memory type. This signal indicates how transactions are required to progress through a system.
		I_M_AXI_AWPROT	: out std_logic_vector(2 downto 0); -- Protection type. This signal indicates the privilege and security level of the transaction, and whether the transaction is a data access or an instruction access.
		I_M_AXI_AWQOS	: out std_logic_vector(3 downto 0); -- Quality of Service, QoS identifier sent for each write transaction.
		I_M_AXI_AWUSER	: out std_logic_vector(C_M_AXI_AWUSER_WIDTH-1 downto 0); -- Optional User-defined signal in the write address channel.
		I_M_AXI_AWVALID	: out std_logic; -- Write address valid. This signal indicates that the channel is signaling valid write address and control information.
		I_M_AXI_AWREADY	: in std_logic; -- Write address ready. This signal indicates that the slave is ready to accept an address and associated control signals
        -- AXI Write Data Channel
		I_M_AXI_WDATA	: out std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0); -- Master Interface Write Data.
		I_M_AXI_WSTRB	: out std_logic_vector(C_M_AXI_DATA_WIDTH/8-1 downto 0); -- Write strobes. This signal indicates which byte lanes hold valid data. There is one write strobe bit for each eight bits of the write data bus.
		I_M_AXI_WLAST	: out std_logic; -- Write last. This signal indicates the last transfer in a write burst.
		I_M_AXI_WUSER	: out std_logic_vector(C_M_AXI_WUSER_WIDTH-1 downto 0); -- Optional User-defined signal in the write data channel.
		I_M_AXI_WVALID	: out std_logic; -- Write valid. This signal indicates that valid write data and strobes are available
		I_M_AXI_WREADY	: in std_logic; -- Write ready. This signal indicates that the slave can accept the write data.
        -- AXI Write Response Channel
		I_M_AXI_BID	: in std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0); -- Master Interface Write Response.
		I_M_AXI_BRESP	: in std_logic_vector(1 downto 0); -- Write response. This signal indicates the status of the write transaction.
		I_M_AXI_BUSER	: in std_logic_vector(C_M_AXI_BUSER_WIDTH-1 downto 0); -- Optional User-defined signal in the write response channel
		I_M_AXI_BVALID	: in std_logic; -- Write response valid. This signal indicates that the  channel is signaling a valid write response.
		I_M_AXI_BREADY	: out std_logic; -- Response ready. This signal indicates that the master can accept a write response.
        -- AXI Read Address Channel
		I_M_AXI_ARID	: out std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0); -- Master Interface Read Address.
		I_M_AXI_ARADDR	: out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0); -- Read address. This signal indicates the initial address of a read burst transaction.
		I_M_AXI_ARLEN	: out std_logic_vector(7 downto 0); -- Burst length. The burst length gives the exact number of transfers in a burst
		I_M_AXI_ARSIZE	: out std_logic_vector(2 downto 0); -- Burst size. This signal indicates the size of each transfer in the burst
		I_M_AXI_ARBURST	: out std_logic_vector(1 downto 0); -- Burst type. The burst type and the size information, determine how the address for each transfer within the burst is calculated.
		I_M_AXI_ARLOCK	: out std_logic; -- Lock type. Provides additional information about the atomic characteristics of the transfer.
		I_M_AXI_ARCACHE	: out std_logic_vector(3 downto 0); -- Memory type. This signal indicates how transactions are required to progress through a system.
		I_M_AXI_ARPROT	: out std_logic_vector(2 downto 0); -- Protection type. This signal indicates the privilege and security level of the transaction, and whether the transaction is a data access or an instruction access.
		I_M_AXI_ARQOS	: out std_logic_vector(3 downto 0); -- Quality of Service, QoS identifier sent for each read transaction
		I_M_AXI_ARUSER	: out std_logic_vector(C_M_AXI_ARUSER_WIDTH-1 downto 0); -- Optional User-defined signal in the read address channel.
		I_M_AXI_ARVALID	: out std_logic; -- Write address valid. This signal indicates that the channel is signaling valid read address and control information
		I_M_AXI_ARREADY	: in std_logic; -- Read address ready. This signal indicates that the slave is ready to accept an address and associated control signals
        -- AXI Read Data Channel
		I_M_AXI_RID	: in std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0); -- Read ID tag. This signal is the identification tag for the read data group of signals generated by the slave.
		I_M_AXI_RDATA	: in std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0); -- Master Read Data
		I_M_AXI_RRESP	: in std_logic_vector(1 downto 0); -- Read response. This signal indicates the status of the read transfer
		I_M_AXI_RLAST	: in std_logic; -- Read last. This signal indicates the last transfer in a read burst
		I_M_AXI_RUSER	: in std_logic_vector(C_M_AXI_RUSER_WIDTH-1 downto 0); -- Optional User-defined signal in the read address channel.
		I_M_AXI_RVALID	: in std_logic; -- Read valid. This signal indicates that the channel is signaling the required read data.
		I_M_AXI_RREADY	: out std_logic; -- Read ready. This signal indicates that the master can accept the read data and response information.
		
       -- AXI Write Address Channel
		D_M_AXI_AWID	: out std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0); -- Master Interface Write Address ID
		D_M_AXI_AWADDR	: out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0); -- Master Interface Write Address
		D_M_AXI_AWLEN	: out std_logic_vector(7 downto 0); -- Burst length. The burst length gives the exact number of transfers in a burst
		D_M_AXI_AWSIZE	: out std_logic_vector(2 downto 0); -- Burst size. This signal indicates the size of each transfer in the burst
		D_M_AXI_AWBURST	: out std_logic_vector(1 downto 0); -- Burst type. The burst type and the size information, determine how the address for each transfer within the burst is calculated.
		D_M_AXI_AWLOCK	: out std_logic; -- Lock type. Provides additional information about the atomic characteristics of the transfer. 
		D_M_AXI_AWCACHE	: out std_logic_vector(3 downto 0); -- Memory type. This signal indicates how transactions are required to progress through a system.
		D_M_AXI_AWPROT	: out std_logic_vector(2 downto 0); -- Protection type. This signal indicates the privilege and security level of the transaction, and whether the transaction is a data access or an instruction access.
		D_M_AXI_AWQOS	: out std_logic_vector(3 downto 0); -- Quality of Service, QoS identifier sent for each write transaction.
		D_M_AXI_AWUSER	: out std_logic_vector(C_M_AXI_AWUSER_WIDTH-1 downto 0); -- Optional User-defined signal in the write address channel.
		D_M_AXI_AWVALID	: out std_logic; -- Write address valid. This signal indicates that the channel is signaling valid write address and control information.
		D_M_AXI_AWREADY	: in std_logic; -- Write address ready. This signal indicates that the slave is ready to accept an address and associated control signals
        -- AXI Write Data Channel
		D_M_AXI_WDATA	: out std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0); -- Master Interface Write Data.
		D_M_AXI_WSTRB	: out std_logic_vector(C_M_AXI_DATA_WIDTH/8-1 downto 0); -- Write strobes. This signal indicates which byte lanes hold valid data. There is one write strobe bit for each eight bits of the write data bus.
		D_M_AXI_WLAST	: out std_logic; -- Write last. This signal indicates the last transfer in a write burst.
		D_M_AXI_WUSER	: out std_logic_vector(C_M_AXI_WUSER_WIDTH-1 downto 0); -- Optional User-defined signal in the write data channel.
		D_M_AXI_WVALID	: out std_logic; -- Write valid. This signal indicates that valid write data and strobes are available
		D_M_AXI_WREADY	: in std_logic; -- Write ready. This signal indicates that the slave can accept the write data.
        -- AXI Write Response Channel
		D_M_AXI_BID	: in std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0); -- Master Interface Write Response.
		D_M_AXI_BRESP	: in std_logic_vector(1 downto 0); -- Write response. This signal indicates the status of the write transaction.
		D_M_AXI_BUSER	: in std_logic_vector(C_M_AXI_BUSER_WIDTH-1 downto 0); -- Optional User-defined signal in the write response channel
		D_M_AXI_BVALID	: in std_logic; -- Write response valid. This signal indicates that the  channel is signaling a valid write response.
		D_M_AXI_BREADY	: out std_logic; -- Response ready. This signal indicates that the master can accept a write response.
        -- AXI Read Address Channel
		D_M_AXI_ARID	: out std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0); -- Master Interface Read Address.
		D_M_AXI_ARADDR	: out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0); -- Read address. This signal indicates the initial address of a read burst transaction.
		D_M_AXI_ARLEN	: out std_logic_vector(7 downto 0); -- Burst length. The burst length gives the exact number of transfers in a burst
		D_M_AXI_ARSIZE	: out std_logic_vector(2 downto 0); -- Burst size. This signal indicates the size of each transfer in the burst
		D_M_AXI_ARBURST	: out std_logic_vector(1 downto 0); -- Burst type. The burst type and the size information, determine how the address for each transfer within the burst is calculated.
		D_M_AXI_ARLOCK	: out std_logic; -- Lock type. Provides additional information about the atomic characteristics of the transfer.
		D_M_AXI_ARCACHE	: out std_logic_vector(3 downto 0); -- Memory type. This signal indicates how transactions are required to progress through a system.
		D_M_AXI_ARPROT	: out std_logic_vector(2 downto 0); -- Protection type. This signal indicates the privilege and security level of the transaction, and whether the transaction is a data access or an instruction access.
		D_M_AXI_ARQOS	: out std_logic_vector(3 downto 0); -- Quality of Service, QoS identifier sent for each read transaction
		D_M_AXI_ARUSER	: out std_logic_vector(C_M_AXI_ARUSER_WIDTH-1 downto 0); -- Optional User-defined signal in the read address channel.
		D_M_AXI_ARVALID	: out std_logic; -- Write address valid. This signal indicates that the channel is signaling valid read address and control information
		D_M_AXI_ARREADY	: in std_logic; -- Read address ready. This signal indicates that the slave is ready to accept an address and associated control signals
        -- AXI Read Data Channel
		D_M_AXI_RID	: in std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0); -- Read ID tag. This signal is the identification tag for the read data group of signals generated by the slave.
		D_M_AXI_RDATA	: in std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0); -- Master Read Data
		D_M_AXI_RRESP	: in std_logic_vector(1 downto 0); -- Read response. This signal indicates the status of the read transfer
		D_M_AXI_RLAST	: in std_logic; -- Read last. This signal indicates the last transfer in a read burst
		D_M_AXI_RUSER	: in std_logic_vector(C_M_AXI_RUSER_WIDTH-1 downto 0); -- Optional User-defined signal in the read address channel.
		D_M_AXI_RVALID	: in std_logic; -- Read valid. This signal indicates that the channel is signaling the required read data.
		D_M_AXI_RREADY	: out std_logic -- Read ready. This signal indicates that the master can accept the read data and response information.
    );
end riscv_micro;

architecture Behavioral of riscv_micro is
    signal CW_Dec : control_word;
    signal CW : control_word;
    signal CW_Zero : control_word;
    signal res : std_logic;
    signal CW_Int : control_word;
    signal CW_Mret : control_word;
    signal clear_cw_full : std_logic;
    signal interrupt_pending : std_logic;
    signal interrupt_taken : std_logic;
    signal trap_active : std_logic;
    signal interrupt_request : std_logic;
    signal selected_cause : std_logic_vector(3 downto 0);
    signal trap_cause : std_logic_vector(3 downto 0);
    signal mepc : std_logic_vector(31 downto 0);

    signal Start_read : std_logic;
    signal Read_address: std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
    signal Current_address: std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
    signal LS_address: std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
    signal Read_Done: std_logic;
    signal Read_Data: std_logic_vector(0 to C_M_AXI_DATA_WIDTH*C_M_AXI_BURST_LEN - 1);
    signal Store_Data: std_logic_vector(0 to C_M_AXI_DATA_WIDTH*C_M_AXI_BURST_LEN - 1);
    signal Load_Data: std_logic_vector(0 to C_M_AXI_DATA_WIDTH*C_M_AXI_BURST_LEN - 1);
    signal Error: std_logic;
    signal LS_Error: std_logic;
    signal exec : std_logic;
    signal fu_PCle: std_logic;
    signal fu_PCie : std_logic;
    signal ls_PCle: std_logic;
    signal ls_PCie : std_logic;
    signal is_load : std_logic;
    signal start_load : std_logic;
    signal is_store : std_logic;
    signal start_store : std_logic;
    signal ls_busy : std_logic;
    signal n_ls_busy :std_logic;
    signal clear_cw :std_logic;
    signal load_data_ready : std_logic;

    constant INTERRUPT_VECTOR : std_logic_vector(31 downto 0) := x"00000080";
    constant MRET_INSTR : std_logic_vector(31 downto 0) := x"30200073";
    signal is_mret : std_logic;
begin
    res <= not Reset;

    selected_cause <= "1011" when INTERRUPT = '1' else
                      "0111" when TIMER_INTERRUPT = '1' else
                      "0011" when SOFTWARE_INTERRUPT = '1' else
                      (others => '0');

    interrupt_request <= '1' when trap_active = '0' and selected_cause /= "0000" else '0';

    process (CLK)
    begin
        if rising_edge(CLK) then
            if Reset = '1' then
                interrupt_pending <= '0';
                trap_active <= '0';
                mepc <= (others => '0');
                trap_cause <= (others => '0');
            elsif interrupt_taken = '1' then
                interrupt_pending <= '0';
                trap_active <= '1';
                mepc <= Current_address;
                trap_cause <= selected_cause;
            elsif is_mret = '1' and exec = '1' then
                trap_active <= '0';
            elsif interrupt_request = '1' then
                interrupt_pending <= '1';
            end if;
        end if;
    end process;

    interrupt_taken <= exec and interrupt_pending;
    is_mret <= '1' when Read_Data = MRET_INSTR else '0';

    CW_Zero <= (
        Asel => (others => '0'),
        Bsel => (others => '0'),
        Dsel => (others => '0'),
        Dlen => '0',
        PCAsel => '0',
        PCAUsel => '0',
        IMMBsel => '0',
        PCDsel => '0',
        PCie => '0',
        PCle => '0',
        isBR => '0',
        isLoad => '0',
        isStore => '0',
        BRcond => (others => '0'),
        ALUFunc => (others => '0'),
        IMM => (others => '0')
    );

    CW_Int <= (
        Asel => (others => '0'),
        Bsel => (others => '0'),
        Dsel => (others => '0'),
        Dlen => '0',
        PCAsel => '0',
        PCAUsel => '0',
        IMMBsel => '1',
        PCDsel => '0',
        PCie => '0',
        PCle => '1',
        isBR => '0',
        isLoad => '0',
        isStore => '0',
        BRcond => (others => '0'),
        ALUFunc => (others => '0'),
        IMM => INTERRUPT_VECTOR
    );

    CW_Mret <= (
        Asel => (others => '0'),
        Bsel => (others => '0'),
        Dsel => (others => '0'),
        Dlen => '0',
        PCAsel => '0',
        PCAUsel => '0',
        IMMBsel => '1',
        PCDsel => '0',
        PCie => '0',
        PCle => '1',
        isBR => '0',
        isLoad => '0',
        isStore => '0',
        BRcond => (others => '0'),
        ALUFunc => (others => '0'),
        IMM => mepc
    );

    fetch_unit : entity work.fetch_unit (Behavioral)
        port map (
            Start_read => Start_read,
            Read_address => Read_address,
            Read_Done => Read_Done,
            Read_Data => Read_Data,
            Error => Error,
            PCle => fu_PCle,
            PCie => fu_PCie,
            Clear_cw => clear_cw_full,
            M_AXI_ACLK => CLK,
            M_AXI_ARESETN => res,
            M_AXI_AWID => I_M_AXI_AWID,
            M_AXI_AWADDR => I_M_AXI_AWADDR,
            M_AXI_AWLEN => I_M_AXI_AWLEN,
            M_AXI_AWSIZE => I_M_AXI_AWSIZE,
            M_AXI_AWBURST => I_M_AXI_AWBURST,
            M_AXI_AWLOCK => I_M_AXI_AWLOCK,
            M_AXI_AWCACHE => I_M_AXI_AWCACHE,
            M_AXI_AWPROT => I_M_AXI_AWPROT,
            M_AXI_AWQOS => I_M_AXI_AWQOS,
            M_AXI_AWUSER => I_M_AXI_AWUSER,
            M_AXI_AWVALID => I_M_AXI_AWVALID,
            M_AXI_AWREADY => I_M_AXI_AWREADY,
            M_AXI_WDATA => I_M_AXI_WDATA,
            M_AXI_WSTRB => I_M_AXI_WSTRB,
            M_AXI_WLAST => I_M_AXI_WLAST,
            M_AXI_WUSER => I_M_AXI_WUSER,
            M_AXI_WVALID => I_M_AXI_WVALID,
            M_AXI_WREADY => I_M_AXI_WREADY,
            M_AXI_BID => I_M_AXI_BID,
            M_AXI_BRESP => I_M_AXI_BRESP,
            M_AXI_BUSER => I_M_AXI_BUSER,
            M_AXI_BVALID => I_M_AXI_BVALID,
            M_AXI_BREADY => I_M_AXI_BREADY,
            M_AXI_ARID => I_M_AXI_ARID,
            M_AXI_ARADDR => I_M_AXI_ARADDR,
            M_AXI_ARLEN => I_M_AXI_ARLEN,
            M_AXI_ARSIZE => I_M_AXI_ARSIZE,
            M_AXI_ARBURST => I_M_AXI_ARBURST,
            M_AXI_ARLOCK => I_M_AXI_ARLOCK,
            M_AXI_ARCACHE => I_M_AXI_ARCACHE,
            M_AXI_ARPROT => I_M_AXI_ARPROT,
            M_AXI_ARQOS => I_M_AXI_ARQOS,
            M_AXI_ARUSER => I_M_AXI_ARUSER,
            M_AXI_ARVALID => I_M_AXI_ARVALID,
            M_AXI_ARREADY => I_M_AXI_ARREADY,
            M_AXI_RID => I_M_AXI_RID,
            M_AXI_RDATA => I_M_AXI_RDATA,
            M_AXI_RRESP => I_M_AXI_RRESP,
            M_AXI_RLAST => I_M_AXI_RLAST,
            M_AXI_RUSER => I_M_AXI_RUSER,
            M_AXI_RVALID => I_M_AXI_RVALID,
            M_AXI_RREADY => I_M_AXI_RREADY);
    
    decoder: entity work.decoder (Behavioral)
        port map (instruction => Read_Data, CW => CW_Dec);
    
    CW <= CW_Int when interrupt_pending = '1' else
          CW_Mret when is_mret = '1' else
          CW_Zero when clear_cw_full = '1' else
          (
            Asel => CW_Dec.Asel,
            Bsel => CW_Dec.Bsel,
            Dsel => CW_Dec.Dsel,
            DLen => CW_Dec.DLen and exec,
            PCAsel => CW_Dec.PCAsel,
            PCAUsel => CW_Dec.PCAUsel,
            IMMBsel => CW_Dec.IMMBsel,
            PCDsel => CW_Dec.PCDsel,
            PCie => fu_PCie,
            PCle => CW_Dec.PCle and exec,
            isBR => CW_Dec.isBR,
            isLoad => CW_Dec.isLoad,
            isStore => CW_Dec.isStore,
            BRcond => CW_Dec.BRcond,
            ALUFunc => CW_Dec.ALUFunc,
            IMM => CW_Dec.IMM);
    
    datapath: entity work.datapath (Behavioral)
        port map (Controller => CW, 
                  clk => CLK, 
                  res => Reset, 
                  pc_addr => Read_address,
                  pc_addr_curr => Current_address,
                  fetch_done => n_ls_busy,
                  is_load => is_load,
                  is_store => is_store,
                  store_data => Store_Data,
                  load_data => Load_Data,
                  ls_addr => LS_address,
                  load_data_ready => load_data_ready
                  );
    
    
    sequencer: entity work.sequencer (Behavioral)
        port map (
                clk => CLK,
                res => RESET,
                start => Start_read, 
                done => Read_Done, 
                exec => exec, 
                Is_load => is_load, 
                Is_store => is_store,
                Start_load => start_load,
                Start_store => start_store,
                Ls_busy => ls_busy,
                clear_cw => clear_cw_full
                );

    clear_cw_full <= clear_cw or interrupt_pending;

    TRAP_CAUSE <= trap_cause;

    n_ls_busy <= not ls_busy;
    
    load_store: entity work.load_store_unit (Behavioral)
        port map (
            Start_load => start_load,
            Start_store => start_store,
            Address => LS_address,
            Store_data => Store_Data,
            Load_Data => Load_Data,
            Ls_busy => ls_busy,
            Error => LS_Error,
            PCle => ls_PCle,
            PCie => ls_PCie,
            L_data_ready => load_data_ready,
            M_AXI_ACLK => CLK,
            M_AXI_ARESETN => res,
            M_AXI_AWID => D_M_AXI_AWID,
            M_AXI_AWADDR => D_M_AXI_AWADDR,
            M_AXI_AWLEN => D_M_AXI_AWLEN,
            M_AXI_AWSIZE => D_M_AXI_AWSIZE,
            M_AXI_AWBURST => D_M_AXI_AWBURST,
            M_AXI_AWLOCK => D_M_AXI_AWLOCK,
            M_AXI_AWCACHE => D_M_AXI_AWCACHE,
            M_AXI_AWPROT => D_M_AXI_AWPROT,
            M_AXI_AWQOS => D_M_AXI_AWQOS,
            M_AXI_AWUSER => D_M_AXI_AWUSER,
            M_AXI_AWVALID => D_M_AXI_AWVALID,
            M_AXI_AWREADY => D_M_AXI_AWREADY,
            M_AXI_WDATA => D_M_AXI_WDATA,
            M_AXI_WSTRB => D_M_AXI_WSTRB,
            M_AXI_WLAST => D_M_AXI_WLAST,
            M_AXI_WUSER => D_M_AXI_WUSER,
            M_AXI_WVALID => D_M_AXI_WVALID,
            M_AXI_WREADY => D_M_AXI_WREADY,
            M_AXI_BID => D_M_AXI_BID,
            M_AXI_BRESP => D_M_AXI_BRESP,
            M_AXI_BUSER => D_M_AXI_BUSER,
            M_AXI_BVALID => D_M_AXI_BVALID,
            M_AXI_BREADY => D_M_AXI_BREADY,
            M_AXI_ARID => D_M_AXI_ARID,
            M_AXI_ARADDR => D_M_AXI_ARADDR,
            M_AXI_ARLEN => D_M_AXI_ARLEN,
            M_AXI_ARSIZE => D_M_AXI_ARSIZE,
            M_AXI_ARBURST => D_M_AXI_ARBURST,
            M_AXI_ARLOCK => D_M_AXI_ARLOCK,
            M_AXI_ARCACHE => D_M_AXI_ARCACHE,
            M_AXI_ARPROT => D_M_AXI_ARPROT,
            M_AXI_ARQOS => D_M_AXI_ARQOS,
            M_AXI_ARUSER => D_M_AXI_ARUSER,
            M_AXI_ARVALID => D_M_AXI_ARVALID,
            M_AXI_ARREADY => D_M_AXI_ARREADY,
            M_AXI_RID => D_M_AXI_RID,
            M_AXI_RDATA => D_M_AXI_RDATA,
            M_AXI_RRESP => D_M_AXI_RRESP,
            M_AXI_RLAST => D_M_AXI_RLAST,
            M_AXI_RUSER => D_M_AXI_RUSER,
            M_AXI_RVALID => D_M_AXI_RVALID,
            M_AXI_RREADY => D_M_AXI_RREADY);
end Behavioral;
