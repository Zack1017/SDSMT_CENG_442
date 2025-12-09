library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RISCV_sequencer_tb is
end RISCV_sequencer_tb;

architecture Behavioral of RISCV_sequencer_tb is

signal rst : std_logic;
signal clk : std_logic :='0';
    
signal instruction_ready : std_logic;
signal exec : std_logic;
signal start_fetch : std_logic;
signal PCie : std_logic;

begin

uut: entity work.sequencer (Behavioral)
    port map ( res => rst, clk => clk,
               done => instruction_ready,
               exec => exec,
               start => start_fetch,
               PCie => PCie );

clk <= not clk after 5ns;
test: process
begin
    rst <= '1';
    instruction_ready <= '0';
    wait for 20 ns;
    rst <= '0';
    
    wait for 45ns;
    
    instruction_ready <= '1';
    wait for 10 ns;
    instruction_ready <= '0';
    
    wait for 40ns;
    instruction_ready <= '1';
    wait for 10 ns;
    instruction_ready <= '0';
    
    wait for 34ns;
    rst <= '1';
wait;
end process;

end Behavioral;
