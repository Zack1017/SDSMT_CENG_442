library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity shifter is
    Port ( op : in STD_LOGIC_VECTOR (3 downto 0);
           a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           shamt : in STD_LOGIC_VECTOR (31 downto 0);
           shift_out : out STD_LOGIC_VECTOR (31 downto 0));
end shifter;

architecture Behavioral of shifter is

signal ua, ub : unsigned(31 downto 0);
signal sa, sb : signed(31 downto 0);

signal amt : integer range 0 to 31;

signal out_sll, out_srl, out_sra : std_logic_vector(31 downto 0);
signal slt_bit, sltu_bit : std_logic;
signal out_slt, out_sltu : std_logic_vector(31 downto 0);

begin
ua <= unsigned(a);
ub <= unsigned(b);
sa <= signed(a);
sb <= signed(b);

amt <= TO_INTEGER (unsigned(shamt));

out_sll <= std_logic_vector(shift_left (ua, amt));
out_srl <= std_logic_vector(shift_right(ua, amt));
out_sra <= std_logic_vector(shift_right(sa, amt));

slt_bit <= '1' when sa < sb else '0';
sltu_bit <= '1' when ua < ub else '0';

out_slt <= (others => '0'); 
out_slt(0) <= slt_bit;
out_sltu <= (others => '0');
out_sltu(0) <= sltu_bit;

shift_out <= out_sll when op = "0010" else
     out_slt when op = "0100" else 
     out_sltu when op = "0110" else 
     out_srl when op = "1010" else
     out_sra when op = "1011" else
     (others => '0');

end Behavioral;
