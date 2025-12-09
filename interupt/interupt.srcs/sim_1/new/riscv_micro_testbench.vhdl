--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
 
--entity riscv_micro_testbench is
--end riscv_micro_testbench;
 
--architecture Behavioral of riscv_micro_testbench is
--  signal reset: std_logic := '0';
--  signal sys_clock : std_logic := '0';
--  signal dip_switch : std_logic_vector( 15 downto 0) := "0000000000000000";
--  signal led : std_logic_vector( 15 downto 0);
 
--begin
 
 
--  uut: entity work.design_1_wrapper (STRUCTURE) 
--    port map(
--      reset => reset,
--      sys_clock => sys_clock,
--      dip_switches_16bits_tri_i => dip_switch,
--      led_16bits_tri_o => led
--      );
--  sys_clock <= not sys_clock after 5 ns;

 
--  process
--  begin
--    wait for 20 ns;
--    reset <= '1';  
--  end process;
 
--end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity riscv_micro_testbench is
--  Port ( );
end riscv_micro_testbench;

architecture Behavioral of riscv_micro_testbench is
  signal dip_switches : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal led_16bits : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal reset, sys_clock: std_logic := '0';
begin
    uut: entity work.design_1_wrapper (STRUCTURE)
        port map (sys_clock => sys_clock, reset => reset, 
                  dip_switches_16bits_tri_i => dip_switches, 
                  led_16bits_tri_o => led_16bits);

    dip_switches <= (others => '0');
    sys_clock <= not sys_clock after 5 ns;
    reset <= '1' after 20 ns;
end Behavioral;