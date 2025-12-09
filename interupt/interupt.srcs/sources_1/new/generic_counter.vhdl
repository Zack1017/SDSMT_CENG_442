----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/02/2025 11:15:46 AM
-- Design Name: 
-- Module Name: generic_counter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity generic_counter is
    Generic ( N : integer := 8);
    Port ( clk : in STD_LOGIC;
           res : in STD_LOGIC;
           incr : in STD_LOGIC;
           max : out STD_LOGIC;
           dout : out std_logic_vector(N-1 downto 0)
           );
end generic_counter;

architecture Behavioral of generic_counter is
    signal q_i, next_q_i: std_logic_vector(N-1 downto 0);
    signal max_q_i : std_logic_vector(N-1 downto 0) := (others => '1');
begin
    q_i <= next_q_i when rising_edge(clk);
    
    next_q_i <= (others => '0') when res = '1' else std_logic_vector(unsigned(q_i) + 1) when incr = '1' else q_i;
    
    max <= '1' when q_i = max_q_i and incr = '1' else '0';
    
    dout <= q_i;
end Behavioral;
