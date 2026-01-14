library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use work.decoder.all;

entity generic_register_file is
    generic (n: integer := 32);
    Port ( 
        Asel : in STD_LOGIC_VECTOR (4 downto 0);
        Bsel : in STD_LOGIC_VECTOR (4 downto 0);
        Dsel : in STD_LOGIC_VECTOR (4 downto 0);
        Din : in STD_LOGIC_VECTOR (N-1 downto 0);
        Den : in STD_LOGIC;
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        a : out STD_LOGIC_VECTOR (N-1 downto 0);
        b : out STD_LOGIC_VECTOR (N-1 downto 0)
     );

           
end generic_register_file;

architecture Behavioral of generic_register_file is
type data is array (31 downto 0) of STD_LOGIC_VECTOR(N-1 downto 0);
--signal regs : reg_array_t := (others => (others=> '0'));
--signal reset : STD_LOGIC;
signal reg_out : data;
signal en : STD_logic;

signal dec : std_logic_vector (31 downto 0);



begin

    dec <= decode(Dsel,Den);
    
    reg: for i in 31 downto 0 generate 
        regI : entity work.generic_register(behavioral) 
        port map
        (clk => clk,en=>dec(i), reset => reset, d => Din, q => reg_out(i));
        
        
        end generate reg;
    a <= reg_out(TO_INTEGER (unsigned(asel)));
    b <= reg_out(TO_INTEGER (unsigned(bsel)));
    --with reg_out select a <= 
    --    reg_out(1) when Asel = "01"
    --    else reg_out(2) when Asel = "10"
    --    else reg_out(3) when Asel = "11"
    --    else reg_out(0) when others;
        
end Behavioral;
