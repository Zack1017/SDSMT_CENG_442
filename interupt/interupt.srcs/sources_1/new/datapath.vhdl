library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.RISCV_package.all;

entity datapath is
    Generic (XLen : integer := 32);
    Port ( Controller : in control_word;
           clk, res : in STD_LOGIC;
           pc_addr : out STD_LOGIC_VECTOR (XLen-1 downto 0);
           pc_addr_curr : out STD_LOGIC_VECTOR (XLen-1 downto 0);
           ls_addr : out STD_LOGIC_VECTOR (XLen-1 downto 0);
           fetch_done: out STD_LOGIC;
           is_load: out STD_LOGIC;
           is_store: out STD_LOGIC;
           store_data: out STD_LOGIC_VECTOR (XLen-1 downto 0);
           load_data: in STD_LOGIC_VECTOR (XLen-1 downto 0);
           load_data_ready : in STD_LOGIC;
           csr_rdata : in STD_LOGIC_VECTOR (XLen-1 downto 0) := (others => '0');
           csr_writeback : in STD_LOGIC := '0';
           rs1_value : out STD_LOGIC_VECTOR (XLen-1 downto 0)
           );
end datapath;

architecture Behavioral of datapath is
    type registerOutput is array (XLen downto 0) of std_logic_vector(XLen - 1 downto 0);
    signal Dbus : STD_LOGIC_VECTOR (XLen-1 downto 0);
    signal Dout : STD_LOGIC_VECTOR (XLen-1 downto 0);
    signal PCout : STD_LOGIC_VECTOR (XLen-1 downto 0);
    signal Curr_PC : STD_LOGIC_VECTOR (XLen-1 downto 0);
    signal Abus : STD_LOGIC_VECTOR (XLen-1 downto 0);
    signal Bbus : STD_LOGIC_VECTOR (XLen-1 downto 0);
    signal RegAOut : STD_LOGIC_VECTOR (XLen-1 downto 0);
    signal RegBOut : STD_LOGIC_VECTOR (XLen-1 downto 0);
    signal BTout : STD_LOGIC;
    signal Dlen : STD_LOGIC;
    signal BRen : STD_LOGIC;
    signal load_ready : std_logic;
begin
     load_ready <= '1' when load_data_ready = '1' and Controller.isLoad = '1' else '0';
     Dlen <= load_ready or Controller.Dlen;

    register_file: entity work.register_file (Behavioral)
        generic map (XLen => XLen)
        port map ( Asel => Controller.Asel, 
                   Bsel => Controller.Bsel, 
                   Dsel => Controller.Dsel,
                   Dlen => Dlen,
                   Dbus => Dbus,
                   Abus => RegAOut,
                   Bbus => RegBOut,
                   clk => clk, res => res);

     Abus <= PCout when Controller.PCAsel = '1' else  
             Curr_PC when Controller.PCAUsel = '1' else RegAOut;
     Bbus <= RegBOut when Controller.IMMBsel = '0' else Controller.IMM;
     
     ALU: entity work.ALU (Behavioral)
        generic map (XLen => XLen)
        port map ( Abus => Abus, Bbus => Bbus, ALUfunc => Controller.ALUfunc, Dout => Dout);
     
     BTU: entity work.branch_test_unit (Behavioral)
        generic map (XLen => XLen)
        port map ( Abus => RegAOut, Bbus => RegBOut, BRcond => Controller.BRcond, isBR => Controller.isBR, BTout => BTout);

     BRen <= BTout or Controller.PCle;
     
     PC: entity work.program_counter (Behavioral)
        generic map (XLen => XLen)
        port map (BRen => BRen, PCie => Controller.PCie, clk => clk, res => res, Din => Dout, PCout => PCout);
     
     current_pc: entity work.generic_register (Behavioral)
        generic map(N => 32)
        port map ( din => PCout, dout => Curr_PC, clk => clk, res => res, en => Controller.PCie);
     
     pc_addr_curr <= Curr_PC;
     pc_addr <= PCout;
     
     ls_addr <= Dout;
     Dbus <= PCout when Controller.PCDsel = '1' else
             csr_rdata when csr_writeback = '1' else
             load_data when load_ready = '1' else Dout;
             
     store_data <= RegBOut;
     is_load <= Controller.isLoad;
     is_store <= Controller.isStore;
     rs1_value <= RegAOut;


end Behavioral;
