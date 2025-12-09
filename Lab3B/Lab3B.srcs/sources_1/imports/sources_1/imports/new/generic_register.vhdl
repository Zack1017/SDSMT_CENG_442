library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity generic_register is
    generic (n: integer := 32);
    Port ( 
           clk, reset: in std_logic;
           d : in  STD_LOGIC_VECTOR ((N-1) downto 0);
           en: in STD_LOGIC;
           q : out STD_LOGIC_VECTOR ((N-1) downto 0)
         );
end generic_register;

architecture Behavioral of generic_register is
    signal q_i, nextq_i : std_logic_vector ((N-1) downto 0) := (others => '0');
begin
        
    q_i <= nextq_i when rising_edge(clk);
    
    nextq_i <= (others => '0') when reset = '1' else d when en = '1' else q_i;
          
    q <= q_i;

end Behavioral;
