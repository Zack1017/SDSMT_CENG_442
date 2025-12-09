library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity btu_testbench is
--  Port ( );
end btu_testbench;

architecture Behavioral of btu_testbench is
    constant XLen : integer := 32;
    signal Abus : STD_LOGIC_VECTOR (XLen-1 downto 0);
    signal Bbus : STD_LOGIC_VECTOR (XLen-1 downto 0);
    signal BRcond : STD_LOGIC_VECTOR (2 downto 0);
    signal isBR : STD_LOGIC;
    signal BTout : STD_LOGIC;
    type conditions is array (5 downto 0) of std_logic_vector(2 downto 0);
    signal conds : conditions := (
        ("000"), --BEQ
        ("001"), --BNE
        ("100"), --BLT
        ("101"), --BGE
        ("110"), --BLTU
        ("111") --BGEU
    );
begin
    uut: entity work.branch_test_unit (Behavioral)
        generic map (XLen => XLen)
        port map (Abus  => Abus,
                  Bbus  => Bbus,
                  BRcond  => BRcond,
                  isBR  => isBR,
                  BTout  => BTout);
    
    process 
    begin
        isBR <= '1';
        
        --BEQ
        BRcond <= conds(5); 
        Abus <= (0 => '1', others => '0');
        Bbus <= (0 => '1', others => '0');
        
        wait for 10ns;
        Bbus <= (others => '0');
        wait for 10ns;
        
        --BNE
        BRcond <= conds(4);
        wait for 10ns;
        Bbus <= (0 => '1', others => '0');
        wait for 10ns;

        --BLT
        BRcond <= conds(3);
        Abus <= (others => '1');
        wait for 10ns;
        Bbus <= (0 => '0', others => '1'); -- -2
        wait for 10ns;
        
        --BGE
        BRcond <= conds(2);
        wait for 10ns;
        Bbus <= (0 => '1', others => '0');
        wait for 10ns;
        
        --BLTU
        BRcond <= conds(1);
        Abus <= (others => '0');
        Bbus <= (others => '1');
        wait for 10ns;
        Abus <= (others => '1');
        Bbus <= (others => '0'); 
        wait for 10ns;
        
        --BGEU
        BRcond <= conds(0);
        Abus <= (others => '1');
        Bbus <= (others => '0');
        wait for 10ns;              
        Abus <= (others => '0');
        Bbus <= (others => '1');    
        wait for 10ns;     
        
        isBR <= '0';

        --BEQ
        BRcond <= conds(5); 
        Abus <= (0 => '1', others => '0');
        Bbus <= (0 => '1', others => '0');
        
        wait for 10ns;
        Bbus <= (others => '0');
        wait for 10ns;
        
        --BNE
        BRcond <= conds(4);
        wait for 10ns;
        Bbus <= (0 => '1', others => '0');
        wait for 10ns;

        --BLT
        BRcond <= conds(3);
        Abus <= (others => '1');
        wait for 10ns;
        Bbus <= (0 => '0', others => '1'); -- -2
        wait for 10ns;
        
        --BGE
        BRcond <= conds(2);
        wait for 10ns;
        Bbus <= (0 => '1', others => '0');
        wait for 10ns;
        
        --BLTU
        BRcond <= conds(1);
        Abus <= (others => '0');
        Bbus <= (others => '1');
        wait for 10ns;
        Abus <= (others => '1');
        Bbus <= (others => '0'); 
        wait for 10ns;
        
        --BGEU
        BRcond <= conds(0);
        Abus <= (others => '1');
        Bbus <= (others => '0');
        wait for 10ns;              
        Abus <= (others => '0');
        Bbus <= (others => '1');    
        wait for 10ns;       
    end process;
end Behavioral;