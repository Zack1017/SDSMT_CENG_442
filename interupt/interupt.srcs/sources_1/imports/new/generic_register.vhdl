library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity generic_register is
    Generic (N: integer := 4);
    Port ( din : in STD_LOGIC_VECTOR (N-1 downto 0) := (others => '0');
           dout : out STD_LOGIC_VECTOR (N-1 downto 0);
           clk, res, en : in STD_LOGIC
           );
end generic_register;

architecture Behavioral of generic_register is
    signal q_i, next_q_i : std_logic_vector(N-1 downto 0);
begin
    --reset and enable 
    --vector of length 2

    q_i <= next_q_i when rising_edge(clk);
    
    next_q_i <= (others => '0') when res = '1' else din when en = '1' else q_i;
    
    dout <= q_i;

end Behavioral;
