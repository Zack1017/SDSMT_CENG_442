library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;


entity generic_shifter is
    generic(shift_bits : natural := 3);
    port (
        din : in std_logic_vector(2**shift_bits-1 downto 0); -- data to be shifted
        shamt: in std_logic_vector(shift_bits-1 downto 0); -- shift amount
        func : in std_logic_vector(3 downto 0); -- type of shift
        dout : out std_logic_vector(2**shift_bits-1 downto 0); -- result of the shift
        co : out std_logic -- carry out
);
end generic_shifter;

architecture Behavioral of generic_shifter is
    type shift_amt_type is array (0 to shift_bits-1) of std_logic_vector(2**shift_bits downto 0);
    signal sGen : shift_amt_type;
begin
    
    with shamt(0) & func select 
        sGen(0) <= din(0)               & din(2**shift_bits-1) & din(2**shift_bits-1 downto 1) when "11101", --SRA
                   din(0)               & '0' & din(2**shift_bits-1 downto 1) when "10101", --SRL
                   din(2**shift_bits-1) & din(2**shift_bits-2 downto 0) & '0' when "10001", --SLL
                   '0' & din when others; -- not really sure what to do here, but I'm assuming carry is zero if there is no operation
        
        
    -- 0 already done
    gen_shift: for I in 1 to shift_bits-1 generate
        with shamt(I) & func select 
            sGen(I) <= sGen(I-1)(2**I-1)                 & (2**I-1 downto 0 => sGen(I-1)(2**shift_bits-1)) & sGen(I-1)(2**shift_bits-1 downto 2**I) when "11101",
                       sGen(I-1)(2**I-1)                 & (2**I-1 downto 0 => '0')                        & sGen(I-1)(2**shift_bits-1 downto 2**I) when "10101",
                       sGen(I-1)((2**shift_bits)-(2**I)) & sGen(I-1)((2**shift_bits-1)-(2**I) downto 0)    & (2**I-1 downto 0 => '0')               when "10001",
                       sGen(I-1) when others;
    end generate gen_shift;
    
    dout <= sGen(shift_bits-1)(2**shift_bits-1 downto 0);
    co <= sGen(shift_bits-1)(2**shift_bits);
end Behavioral;
