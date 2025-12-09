library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


entity pc is
    Port ( 
           clk : in std_logic;
           aluOut : in STD_LOGIC_VECTOR (31 downto 0);
           PCLE_BTU : in STD_LOGIC;
           PCie : in STD_LOGIC;
           reset: in STD_LOGIC;
           pcOut : out STD_LOGIC_VECTOR (31 downto 0));
end pc;

architecture Behavioral of pc is

signal pc_q, pc_plusk, d_mux : std_logic_vector(31 downto 0);
signal ce_any : std_logic;
begin

ce_any <= PCie or PCLE_BTU; 

pc_plusk <= std_logic_vector(unsigned(pc_q) + TO_UNSIGNED(4, 31));

d_mux <= aluout when PCLE_BTU = '1' else pc_plusk;

--Todo Add Support for starting with 0 

reg : entity work.generic_register(behavioral) 
        port map
        (clk => clk,
         en=> ce_any, 
         reset => reset, 
         d => d_mux,
         q => pc_q
         );
pcOut <= pc_q;
         
end Behavioral;
