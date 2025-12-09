library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu is
    Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           ALUfunc : in STD_LOGIC_VECTOR (3 downto 0);
           aluOut : out STD_LOGIC_VECTOR (31 downto 0));
end alu;

architecture Behavioral of alu is

signal add_sub_op: std_logic;
signal addsub_out: std_logic_vector(31 downto 0);
signal shift_op : std_logic_vector(3 downto 0);
signal shift_out : std_logic_vector(31 downto 0);
signal shamt : std_logic_vector(31 downto 0);

component Add_sub
    port(
            a : in STD_LOGIC_VECTOR (31 downto 0);
            b : in STD_LOGIC_VECTOR (31 downto 0);
            op : in STD_LOGIC;
            --sign : in STD_LOGIC;
            result : out STD_LOGIC_VECTOR (31 downto 0)
    );
end component;

component shifter
    port(
           op : in STD_LOGIC_VECTOR (3 downto 0);
           a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           shamt : in STD_LOGIC_VECTOR (31 downto 0);
           shift_out : out STD_LOGIC_VECTOR (31 downto 0)
    );
end component;

begin

Sub_Add : Add_sub
    port map(
        a => a,
        b => b,
        op => add_sub_op,
        --sign => sign,
        result => addsub_out
    );
    
shift : shifter
    port map(
        op => ALUFunc,
        a => a,
        b => b, 
        shamt => shamt,
        shift_out => shift_out
    );
    
--logic Block 
with ALUfunc select
    aluOut <= shift_out     when "0010",
               shift_out     when "0100",
               shift_out     when "0110",
               shift_out     when "1010",
               shift_out     when "1011",
               addsub_out    when "0000",
               addsub_out    when "0001",
               (a xor b)     when "1000",
               (a or b)      when "1100",
               (a and b)     when "1110",
               (others => '0') when others;



end Behavioral;
