----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/02/2025 11:45:56 AM
-- Design Name: 
-- Module Name: sys_counter_testbench - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sys_counter_testbench is
--  Port ( );
end sys_counter_testbench;

architecture Behavioral of sys_counter_testbench is
  signal reset, clk: std_logic := '0';
  signal interrupt : std_logic;
begin
    uut : entity work.sys_clock_wrapper ( STRUCTURE )
        port map (clk_in1 => clk, reset => reset);
        
    clk <= not clk after 5 ns;
    reset <= '1' after 20 ns;
end Behavioral;
