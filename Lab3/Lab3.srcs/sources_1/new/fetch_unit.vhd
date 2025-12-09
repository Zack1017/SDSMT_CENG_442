library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all; 

entity fetch_unit is
  generic (
    USE_APB : boolean := true
   );
   port(
    state_q : in std_logic_vector(1 downto 0); 
    state_1 : out std_logic_vector(1 downto 0); 
    
    start : in std_logic; 
    pc_i : in std_logic_vector(31 downto 0); 
    
    ARREADY        : in  std_logic;
    RVALID         : in  std_logic;
    RDATA          : in  std_logic_vector(31 downto 0);
    ARADDR         : out std_logic_vector(31 downto 0);
    ARVALID        : out std_logic;
    RREADY         : out std_logic;

    PREADY         : in  std_logic;
    PRDATA         : in  std_logic_vector(31 downto 0);
    PADDR          : out std_logic_vector(31 downto 0);
    PSEL           : out std_logic;
    PENABLE        : out std_logic;
    PWRITE         : out std_logic;
    PWDATA         : out std_logic_vector(31 downto 0);

    data_from_bus  : out std_logic_vector(31 downto 0);  -- muxed RDATA/PRDATA
    IRLEN          : out std_logic;  -- pulse: latch instruction
    PCIE           : out std_logic;  -- pulse: increment PC
    DONE           : out std_logic;   -- pulse: transaction complete
    
    state_d : out std_logic_vector(1 downto 0)
   );
end fetch_unit;

architecture Behavioral of fetch_unit is
CONSTANT IDLE : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
CONSTANT S1: STD_LOGIC_VECTOR(1 DOWNTO 0) := "01";
CONSTANT S2: STD_LOGIC_VECTOR(1 DOWNTO 0) := "10";
CONSTANT ACC: STD_LOGIC_VECTOR(1 DOWNTO 0) := "11";

SIGNAL use_apb_s : std_logic; 
SIGNAL use_axi_s : std_logic; 

begin

use_apb_s <= '1' when USE_APB else '0'; 
use_axi_s <= '1' when USE_APB else '1'; 

IRLEN <= '1' when state_q = ACC else '0'; 
PCIE <= '1' when state_q = ACC else '0'; 
DONE <= '1' when state_q = ACC else '0'; 

data_from_bus <= PRDATA when USE_APB else RDATA; 

ARADDR <= pc_i; 
PADDR <= pc_i; 

ARVALID <= '1' when (use_axi_s ='1' and state_q = S1) else '0'; 
RREADY <= '1' when (use_axi_s = '1' and state_q = S2) else '0'; 

PSEL <= '1' when (use_apb_s ='1' and (state_q = S1 or state_q = S2)) else '0'; 
PENABLE <= '1' when (use_apb_s = '1' and state_q = S2) else '0'; 
PWRITE <= '0'; 
PWDATA <= (others => '0'); 

state_d <=
      -- From IDLE
      S1   when (state_q = IDLE and start = '1') else
      IDLE when (state_q = IDLE) else
      -- From S1: AXI waits for ARREADY, APB always advances next cycle
      S2   when (state_q = S1 and ( (use_axi_s = '1' and ARREADY = '1') or (use_apb_s = '1') )) else
      S1   when (state_q = S1) else
      -- From S2: AXI waits for RVALID, APB waits for PREADY
      ACC  when (state_q = S2 and ( (use_axi_s = '1' and RVALID = '1') or (use_apb_s = '1' and PREADY = '1') )) else
      S2   when (state_q = S2) else
      -- From ACC
      IDLE;  -- state_q = ACC




end Behavioral;
