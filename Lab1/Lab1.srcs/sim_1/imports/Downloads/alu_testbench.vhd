library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_misc.all;

entity alu_testbench is
end alu_testbench;

architecture Behavioral of alu_testbench is
    constant XLen : integer := 32;
    signal Abus : STD_LOGIC_VECTOR (XLen-1 downto 0);
    signal Bbus : STD_LOGIC_VECTOR (XLen-1 downto 0);
    signal ALUfunc : STD_LOGIC_VECTOR (3 downto 0);
    signal Dout : STD_LOGIC_VECTOR (XLen-1 downto 0);
begin
    uut: entity work.alu (Behavioral)
        generic map (XLen => XLen)
        port map (Abus => Abus,
                  Bbus => Bbus,
                  ALUfunc => ALUfunc,
                  Dout => Dout);
    
    test_process: process 
        variable dout_int :integer;
        variable expected_dout : STD_LOGIC_VECTOR(XLen - 1 downto 0);
    begin
        -- Test Case 1: Addition (1 + 2 = 3)
        Abus <= (0 => '1', others => '0'); -- Abus = 1
        Bbus <= (1 => '1', others => '0'); -- Abus = 2
        ALUfunc <= "0000";

        wait for 10ns;
        
        dout_int := to_integer(unsigned(Dout)); 
        assert dout_int = 3 report "1: 1 + 2 != " & integer'image(dout_int) severity error;
        ----------------------------------------------------------------------------------------------------------------
        -- Test Case 2: Subtraction (1 - 2 = -1)    
        Abus <= (0 => '1', others => '0'); -- Abus = 1
        Bbus <= (1 => '1', others => '0'); -- Bbus = 2
        ALUfunc <= "1000"; --Subtract

        wait for 10ns;
        
        dout_int := to_integer(signed(Dout)); 
        assert dout_int = -1 report "2: 1 - 2 != " & integer'image(dout_int) severity error;
        ----------------------------------------------------------------------------------------------------------------
        -- Test Case 3: XOR (0101 XOR 0011 = 0110, which is 6)
        ALUfunc <= "0100"; --XOR
       
        Abus(3 downto 0) <= "0101";
        Bbus(3 downto 0) <= "0011";
       
        wait for 10ns;
        
        dout_int := to_integer(unsigned(Dout)); 
        assert dout_int = 6 report "3: 0101 xor 0011 != " & integer'image(dout_int) severity error;
        ----------------------------------------------------------------------------------------------------------------
        -- Test Case 4: OR (0101 OR 0011 = 0111, which is 7)
        ALUfunc <= "0110";
        
        Abus(3 downto 0) <= "0101";
        Bbus(3 downto 0) <= "0011";
        
        wait for 10ns;
        
        dout_int := to_integer(unsigned(Dout)); 
        assert dout_int = 7 report "4: 0101 or 0011 != " & integer'image(dout_int) severity error;
        ----------------------------------------------------------------------------------------------------------------
        -- Test Case 5: AND (0101 AND 0011 = 0001, which is 1)
        ALUfunc <= "0111";
        
        Abus(3 downto 0) <= "0101";
        Bbus(3 downto 0) <= "0011";
        
        wait for 10ns;
        
        dout_int := to_integer(unsigned(Dout)); 
        assert dout_int = 1 report "5: 0101 and 0011 != " & integer'image(dout_int) severity error;
        ----------------------------------------------------------------------------------------------------------------
        -- Test Case 6: Set Less Than (true) 
        ALUfunc <= "0010";
        
        Abus <= (others => '1');           -- Abus = -1
        Bbus <= (0 => '1', others => '0'); -- Bbus = 1
        
        wait for 10ns;
         
        dout_int := to_integer(unsigned(Dout)); 
        assert dout_int = 1 report "6: Dout is false when should be true" severity error;

        -- Test Case 7: Set Less Than (false)
        Abus <= (0 => '1', others => '0'); -- Abus = 1        
        Bbus <= (others => '1');           -- Bbus = -1
        
        wait for 10ns;
         
        dout_int := to_integer(unsigned(Dout)); 
        assert dout_int = 0 report "7: Dout is true when should be false" severity error;
        ----------------------------------------------------------------------------------------------------------------
        --Test Case 8: Set Less Than Unsigned (true)
        ALUfunc <= "0011";
        
        Abus <= (0 => '1', others => '0'); -- Abus = 1
        Bbus <= (others => '1');           -- Bbus = -1
        
        wait for 10ns;
         
        dout_int := to_integer(unsigned(Dout)); 
        assert dout_int = 1 report "8: Dout is false when should be true" severity error;

        -- Test Case 7: Set Less Than (false)
        Abus <= (others => '1');           -- Abus = -1
        Bbus <= (0 => '1', others => '0'); -- Bbus = 1
        
        wait for 10ns;
         
        dout_int := to_integer(unsigned(Dout)); 
        assert dout_int = 0 report "9: Dout is true when should be false" severity error;
        ----------------------------------------------------------------------------------------------------------------
        --Test Case 10: Shift Left Logical
        ALUfunc <= "0001";        

        Abus <= (others => '1'); 
        Bbus <= std_logic_vector(to_unsigned(5, XLen)); 
        
        wait for 10ns;
        
        expected_dout := (XLen-1 downto 6 => '1', others => '0');
        assert Dout = expected_dout report "10: SLL amount is incorrect" severity error;
        ----------------------------------------------------------------------------------------------------------------
        --Test Case 11: Shift Right Logical
        ALUfunc <= "0101";
        
        Abus <= (others => '1'); 
        Bbus <= std_logic_vector(to_unsigned(5, XLen)); 
        
        wait for 10ns;
        
        expected_dout := (XLen-1 downto XLen-5 => '0', others => '1');        
        assert Dout = expected_dout report "11: SRL amount is incorrect" severity error;
        ----------------------------------------------------------------------------------------------------------------
        --Test Case 12: Shift Right Arithmetic
        ALUfunc <= "1101";
        Abus <= (XLen-1 => '1', others => '0'); 
        Bbus <= std_logic_vector(to_unsigned(5, XLen)); 
        
        wait for 10ns;
        
        expected_dout := (XLen-1 downto XLen-6 => '1', others => '0');
        assert Dout = expected_dout report "12: SRA is incorrect" severity error;

    end process test_process;
end Behavioral;
