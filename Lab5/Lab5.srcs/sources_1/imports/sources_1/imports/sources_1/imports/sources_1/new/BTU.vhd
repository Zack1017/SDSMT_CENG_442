library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity BTU is
    Port ( BRcond : in STD_LOGIC_VECTOR (2 downto 0);
           isBR : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           take_branch : out STD_LOGIC);
end BTU;

architecture Behavioral of BTU is

signal ua, ub : unsigned(31 downto 0);
signal sa, sb : signed(31 downto 0);

signal beq, bne, blt, bge, bltu, bgeu: std_logic; 
signal cond_true : std_logic; 

begin

ua <= unsigned(a);
ub <= unsigned(b);
sa <= signed(a);
sb <= signed(b);

beq <= '1' when a =b else '0';
bne <= not beq;

blt <= '1' when sa < sb else '0';
bge <= not blt; 

bltu <= '1' when ua < ub else '0';
bgeu <= not bltu;

with BRcond select
    cond_true <= beq     when "000",
                 bne     when "001",
                 blt     when "100",
                 bge     when "101",
                 bltu    when "110",
                 bgeu    when "111",
                 '0'     when others;

take_branch <= isBR and cond_true;

end Behavioral;
