library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity Add_sub is
    Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           op : in STD_LOGIC;
           --sign : in STD_LOGIC;
           result : out STD_LOGIC_VECTOR (31 downto 0)
    );
end Add_sub;

architecture Behavioral of Add_sub is

signal ua, ub : unsigned(31 downto 0);
--signal sa, sb : signed(31 downto 0);

signal u_res : unsigned(31 downto 0);
--signal s_res : signed (31 downto 0);

begin

ua <= unsigned(a);
ub <= unsigned(b);
--sa <= signed(a);
--sb <= signed(b);

with op select 
    u_res <= ua - ub when '1',
    ua + ub when others;

result <= std_logic_vector(u_res);
    
--with op select 
--    s_res <= sa - sb when '1',
--    sa + sb when others;
    
--result <= std_logic_vector(s_res) when sign = '1'
--    else std_logic_vector(u_res);


end Behavioral;
