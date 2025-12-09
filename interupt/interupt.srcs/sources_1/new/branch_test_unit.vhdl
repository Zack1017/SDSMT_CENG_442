library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.math_real.all;

entity branch_test_unit is
    Generic (XLen : integer := 32);
    Port ( Abus : in STD_LOGIC_VECTOR (XLen-1 downto 0);
           Bbus : in STD_LOGIC_VECTOR (XLen-1 downto 0);
           BRcond : in STD_LOGIC_VECTOR (2 downto 0);
           isBR : in STD_LOGIC;
           BTout : out STD_LOGIC);
end branch_test_unit;

architecture Behavioral of branch_test_unit is
    signal eq : std_logic;
    signal lt : std_logic;
    signal ltu : std_logic;
    signal res : std_logic;
begin
    eq <= '1' when (Abus = Bbus) else '0';
    lt <= '1' when (signed(Abus) < signed(Bbus)) else '0';
    ltu <= '1' when (unsigned(Abus) < unsigned(Bbus)) else '0';
    
    with BRcond select
        res <= eq when "000", --eq
           not eq when "001", --neq
               lt when "100", --lt
           not lt when "101", --ge
              ltu when "110", --ltu
          not ltu when "111", --geu
              '0' when others;
    
    BTout <= res and isBR;
end Behavioral;
