library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity program_counter is
    Generic (XLen : integer := 32);
    Port ( BRen : in STD_LOGIC;
           PCie : in STD_LOGIC;
           clk : in STD_LOGIC;
           res : in STD_LOGIC;
           Din : in STD_LOGIC_VECTOR (XLen-1 downto 0);
           PCout : out STD_LOGIC_VECTOR (XLen-1 downto 0));
end program_counter;

architecture Behavioral of program_counter is
    signal cur_addr, next_addr : std_logic_vector(Xlen-1 downto 0);
begin
    cur_addr <= next_addr when rising_edge (clk);
    
    next_addr <= (others => '0') when res = '1' else
                 Din when BRen = '1' else
                 std_logic_vector(unsigned(cur_addr) + 4) when PCie = '1' else 
                 cur_addr;
    
    PCout <= cur_addr;
end Behavioral;
