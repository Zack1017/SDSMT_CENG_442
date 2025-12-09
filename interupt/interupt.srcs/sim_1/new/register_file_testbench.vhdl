library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity register_file_testbench is
--  Port ( );
end register_file_testbench;

architecture Behavioral of register_file_testbench is
    constant XLen : integer := 32;
    signal Asel : STD_LOGIC_VECTOR (4 downto 0); --TODO make these generic
    signal Bsel : STD_LOGIC_VECTOR (4 downto 0);
    signal Dsel : STD_LOGIC_VECTOR (4 downto 0);
    signal Dlen : STD_LOGIC;
    signal Abus : STD_LOGIC_VECTOR (XLen-1 downto 0);
    signal Bbus : STD_LOGIC_VECTOR (XLen-1 downto 0);
    signal Dbus : STD_LOGIC_VECTOR (XLen-1 downto 0);
    signal clk : STD_LOGIC := '0';
    signal res : STD_LOGIC;
begin
    
    uut: entity work.register_file (Behavioral)
        generic map (XLen => XLen)
        port map (
            Asel => Asel,
            Bsel => Bsel,
            Dsel => Dsel,
            Dlen => Dlen,
            Abus => Abus,
            Bbus => Bbus,
            Dbus => Dbus,
            clk  => clk ,
            res  => res);
   
   process 
       variable asel_val :integer;
       variable bsel_val :integer;
   begin
      Dlen <= '1';

      clk <= '1';
      res <= '1';
      wait for 10ns;
      clk <= '0';
      res <= '0';
      
      --test regular function

      for i in 1 to 31 loop --cannot load zero register
         Dbus <= std_logic_vector(to_unsigned(i, 32));
         Dsel <= std_logic_vector(to_unsigned(i, 5));
         Dlen <= '1';
         --wait for clock
         
         clk <= '1';  
         wait for 10ns;
         clk <= '0';
         wait for 10ns;
      end loop;

      
      for i in 0 to 31 loop
         for j in 0 to 31 loop
            Asel <= std_logic_vector(to_unsigned(i, 5));
            Bsel <= std_logic_vector(to_unsigned(j, 5));

            clk <= '1';
            wait for 10ns;
            clk <= '0';
            wait for 10ns;
            
            asel_val := to_integer(unsigned(Asel));        
            bsel_val := to_integer(unsigned(Bsel));        
            
            assert asel_val = i
                report "Asel wrong. Asel = " & integer'image(asel_val) & " and i = " & integer'image(i)
                severity error;
            assert bsel_val = j
                report "Bsel wrong. Bsel = " & integer'image(bsel_val) & " and j = " & integer'image(j)
                severity error;
         end loop;
      end loop;
      
      --test latch enable
      
      res <= '1';
      wait for 10ns;
      res <= '0';
      
      Dlen <= '0';

      for i in 1 to 31 loop --cannot load zero register
         Dbus <= std_logic_vector(to_unsigned(i, 32));
         Dsel <= std_logic_vector(to_unsigned(i, 5));
         Dlen <= '1';
         --wait for clock
         
         clk <= '1';  
         wait for 10ns;
         clk <= '0';
         wait for 10ns;
      end loop;

      
      for i in 0 to 31 loop
         for j in 0 to 31 loop
            Asel <= std_logic_vector(to_unsigned(i, 5));
            Bsel <= std_logic_vector(to_unsigned(j, 5));

            clk <= '1';
            wait for 10ns;
            clk <= '0';
            wait for 10ns;

            asel_val := to_integer(unsigned(Asel));        
            bsel_val := to_integer(unsigned(Bsel));   
            
            assert asel_val = 0
                report "Asel not equal to zero. Asel = " & integer'image(asel_val)
                severity error;
            assert bsel_val = 0
                report "Bsel not equal to zero. Bsel = " & integer'image(bsel_val)
                severity error;
            

         end loop;
      end loop;
      
    end process;
         
end Behavioral;
