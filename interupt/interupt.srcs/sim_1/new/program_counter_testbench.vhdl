library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity program_counter_testbench is
--  Port ( );
end program_counter_testbench;

architecture Behavioral of program_counter_testbench is
    constant XLen : integer := 32;
    signal BRen : STD_LOGIC;
    signal PCie : STD_LOGIC;
    signal clk : STD_LOGIC;
    signal res : STD_LOGIC;
    signal Din : STD_LOGIC_VECTOR (XLen-1 downto 0);
    signal PCout : STD_LOGIC_VECTOR (XLen-1 downto 0);
begin
    uut: entity work.program_counter (Behavioral)
        generic map (XLen => Xlen)
        port map (BRen => BRen, 
                  PCie => PCie, 
                  clk => clk, 
                  res => res, 
                  Din => Din, 
                  PCout => PCout);
                  
    process begin
        BRen <= '0';
        PCie <= '1';
        res <= '1';
        clk <= '0';
        wait for 10ns;
        res <= '0';

        for i in 0 to 31 loop
            clk <= not clk;
            wait for 10ns;
        end loop;
        
        BRen <= '1';
        Din <= (Xlen-1 => '1', others => '0');
        wait for 10ns;
        BRen <= '0';
        
        for i in 0 to 4 loop
            clk <= not clk;
            wait for 10ns;
        end loop;
        
        PCie <= '0';
        
        for i in 0 to 31 loop
            clk <= not clk;
            wait for 10ns;
        end loop;
        
        BRen <= '1';
        Din <= (Xlen-1 => '1', others => '0');
        wait for 10ns;
        BRen <= '0';

        for i in 0 to 4 loop
            clk <= not clk;
            wait for 10ns;
        end loop;
        
    end process;
    
end Behavioral;
