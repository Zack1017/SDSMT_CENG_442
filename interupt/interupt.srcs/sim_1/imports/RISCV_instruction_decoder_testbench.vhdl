----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/09/2024 11:37:32 AM
-- Design Name: 
-- Module Name: RISCV_instruction_decoder_testbench - Behavioral
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
use IEEE.numeric_std.ALL;
use work.RISCV_package.all;

entity RISCV_Inst_Dec_tb is
end RISCV_Inst_Dec_tb;

architecture Behavioral of RISCV_Inst_Dec_tb is

signal instruction : std_logic_vector(31 downto 0);   

signal my_control_word : control_word;
begin


uut: entity work.decoder(Behavioral)
port map
(
    instruction => instruction,
    CW => my_control_word
);

test: process
begin
instruction <= X"00247CB7";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 25 and signed(my_control_word.IMM) = 2387968 and unsigned(my_control_word.Asel) = 0 and my_control_word.ALUFunc = "0000" report "LUI #1 not working" severity warning;

instruction <= X"008107B7";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 15 and signed(my_control_word.IMM) = 8454144 and unsigned(my_control_word.Asel) = 0 and my_control_word.ALUFunc = "0000" report "LUI #2 not working" severity warning;

instruction <= X"0BED0BB7";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 23 and signed(my_control_word.IMM) = 200081408 and unsigned(my_control_word.Asel) = 0 and my_control_word.ALUFunc = "0000" report "LUI #3 not working" severity warning;


instruction <= X"142CAEB7";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 29 and signed(my_control_word.IMM) = 338468864 and unsigned(my_control_word.Asel) = 0 and my_control_word.ALUFunc = "0000" report "LUI #4 not working" severity warning;


instruction <= X"095E5C37";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 24 and signed(my_control_word.IMM) = 157175808 and unsigned(my_control_word.Asel) = 0 and my_control_word.ALUFunc = "0000" report "LUI #5 not working" severity warning;

instruction <= X"01511A17";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 20 and signed(my_control_word.IMM) = 22089728 and my_control_word.ALUFunc = "0000" report "AUIPC #1 not working" severity warning;

instruction <= X"000C8B97";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 23 and signed(my_control_word.IMM) = 819200 and my_control_word.ALUFunc = "0000" report "AUIPC #2 not working" severity warning;

instruction <= X"FE5FF06F";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 0 and signed(my_control_word.IMM) = -28 and my_control_word.ALUFunc = "0000" report "JAL #1 not working" severity warning;

instruction <= X"018002EF";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 5 and signed(my_control_word.IMM) = 24 and my_control_word.ALUFunc = "0000" report "JAL #2 not working" severity warning;

instruction <= X"FEC08067";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 0 and unsigned(my_control_word.Asel) = 1 and signed(my_control_word.IMM) = -20 and my_control_word.ALUFunc = "0000" report "JALR #1 not working" severity warning;

instruction <= X"12C10067";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 0 and unsigned(my_control_word.Asel) = 2 and signed(my_control_word.IMM) = 300 and my_control_word.ALUFunc = "0000" report "JALR #2 not working" severity warning;

instruction <= X"00000663";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 0 and unsigned(my_control_word.Asel) = 0 and unsigned(my_control_word.Bsel) = 0 and signed(my_control_word.IMM) = 12 and my_control_word.ALUFunc = "0000" report "BRANCH #1 not working" severity warning;

instruction <= X"00209463";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 0 and unsigned(my_control_word.Asel) = 1 and unsigned(my_control_word.Bsel) = 2 and signed(my_control_word.IMM) = 8 and my_control_word.ALUFunc = "0000" report "BRANCH #2 not working" severity warning;

instruction <= X"0041C263";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 0 and unsigned(my_control_word.Asel) = 3 and unsigned(my_control_word.Bsel) = 4 and signed(my_control_word.IMM) = 4 and my_control_word.ALUFunc = "0000" report "BRANCH #3 not working" severity warning;

instruction <= X"00525063";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 0 and unsigned(my_control_word.Asel) = 4 and unsigned(my_control_word.Bsel) = 5 and signed(my_control_word.IMM) = 0 and my_control_word.ALUFunc = "0000" report "BRANCH #4 not working" severity warning;

instruction <= X"FE736EE3";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 0 and unsigned(my_control_word.Asel) = 6 and unsigned(my_control_word.Bsel) = 7 and signed(my_control_word.IMM) = -4 and my_control_word.ALUFunc = "0000" report "BRANCH #5 not working" severity warning;

instruction <= X"FE83FCE3";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 0 and unsigned(my_control_word.Asel) = 7 and unsigned(my_control_word.Bsel) = 8 and signed(my_control_word.IMM) = -8 and my_control_word.ALUFunc = "0000" report "BRANCH #6 not working" severity warning;

instruction <= X"4E550483";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 9 and unsigned(my_control_word.Asel) = 10 and signed(my_control_word.IMM) = 1253 and my_control_word.ALUFunc = "0000" report "LOAD #1 not working" severity warning;

instruction <= X"DCD61583";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 11 and unsigned(my_control_word.Asel) = 12 and signed(my_control_word.IMM) = -563 and my_control_word.ALUFunc = "0001" report "LOAD #2 not working" severity warning;

instruction <= X"19372683";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 13 and unsigned(my_control_word.Asel) = 14 and signed(my_control_word.IMM) = 403 and my_control_word.ALUFunc = "0010" report "LOAD #3 not working" severity warning;

instruction <= X"18284783";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 15 and unsigned(my_control_word.Asel) = 16 and signed(my_control_word.IMM) = 386 and my_control_word.ALUFunc = "0100" report "LOAD #4 not working" severity warning;

instruction <= X"12F95883";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 17 and unsigned(my_control_word.Asel) = 18 and signed(my_control_word.IMM) = 303 and my_control_word.ALUFunc = "0101" report "LOAD #5 not working" severity warning;

instruction <= X"153A0E23";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 0 and unsigned(my_control_word.Asel) = 20 and unsigned(my_control_word.Bsel) = 19 and signed(my_control_word.IMM) = 348 and my_control_word.ALUFunc = "0000" report "STORE #1 not working" severity warning;

instruction <= X"355B11A3";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 0 and unsigned(my_control_word.Asel) = 22 and unsigned(my_control_word.Bsel) = 21 and signed(my_control_word.IMM) = 835 and my_control_word.ALUFunc = "0000" report "STORE #2 not working" severity warning;

instruction <= X"3B7C2423";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 0 and unsigned(my_control_word.Asel) = 24 and unsigned(my_control_word.Bsel) = 23 and signed(my_control_word.IMM) = 936 and my_control_word.ALUFunc = "0000" report "STORE #3 not working" severity warning;

instruction <= X"3C8D0C93";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 25 and unsigned(my_control_word.Asel) = 26 and signed(my_control_word.IMM) = 968 and my_control_word.ALUFunc = "0000" report "ADDI #1 not working" severity warning;

instruction <= X"ED5E0D93";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 27 and unsigned(my_control_word.Asel) = 28 and signed(my_control_word.IMM) = -299 and my_control_word.ALUFunc = "0000" report "ADDI #2 not working" severity warning;

instruction <= X"FFF00F13";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 30 and unsigned(my_control_word.Asel) = 0 and signed(my_control_word.IMM) = -1 and my_control_word.ALUFunc = "0000" report "ADDI #3 not working" severity warning;

instruction <= X"7FF08E13";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 28 and unsigned(my_control_word.Asel) = 1 and signed(my_control_word.IMM) = 2047 and my_control_word.ALUFunc = "0000" report "ADDI #4 not working" severity warning;

instruction <= X"E0C8A793";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 15 and unsigned(my_control_word.Asel) = 17 and signed(my_control_word.IMM) = -500 and my_control_word.ALUFunc = "0010" report "SLTI not working" severity warning;

instruction <= X"EDC93393";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 7 and unsigned(my_control_word.Asel) = 18 and signed(my_control_word.IMM) = -292 and my_control_word.ALUFunc = "0011" report "SLTIU not working" severity warning;

instruction <= X"F9C14093";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 1 and unsigned(my_control_word.Asel) = 2 and signed(my_control_word.IMM) = -100 and my_control_word.ALUFunc = "0100" report "XORI not working" severity warning;

instruction <= X"1F426193";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 3 and unsigned(my_control_word.Asel) = 4 and signed(my_control_word.IMM) = 500 and my_control_word.ALUFunc = "0110" report "ORI not working" severity warning;

instruction <= X"EBF37293";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 5 and unsigned(my_control_word.Asel) = 6 and signed(my_control_word.IMM) = -321 and my_control_word.ALUFunc = "0111" report "ANDI not working" severity warning;

instruction <= X"00141393";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 7 and unsigned(my_control_word.Asel) = 8 and signed(my_control_word.IMM) = 1 and my_control_word.ALUFunc = "0001" report "SLLI #1 not working" severity warning;

instruction <= X"01D51493";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 9 and unsigned(my_control_word.Asel) = 10 and signed(my_control_word.IMM) = 29 and my_control_word.ALUFunc = "0001" report "SLLI #2 not working" severity warning;

instruction <= X"00265593";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 11 and unsigned(my_control_word.Asel) = 12 and signed(my_control_word.IMM) = 2 and my_control_word.ALUFunc = "0101" report "SRLI #1 not working" severity warning;

instruction <= X"01F75693";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 13 and unsigned(my_control_word.Asel) = 14 and signed(my_control_word.IMM) = 31 and my_control_word.ALUFunc = "0101" report "SRLI #2 not working" severity warning;

instruction <= X"40385793";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 15 and unsigned(my_control_word.Asel) = 16 and unsigned(my_control_word.IMM(4 downto 0)) = 3 and my_control_word.ALUFunc = "1101" report "SRAI #1 not working" severity warning;

instruction <= X"41E95893";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 17 and unsigned(my_control_word.Asel) = 18 and unsigned(my_control_word.IMM(4 downto 0)) = 30 and my_control_word.ALUFunc = "1101" report "SRAI #2 not working" severity warning;

instruction <= X"00208033";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 0 and unsigned(my_control_word.Asel) = 1 and unsigned(my_control_word.Bsel) = 2 and my_control_word.ALUFunc = "0000" report "ADD not working" severity warning;

instruction <= X"40418133";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 2 and unsigned(my_control_word.Asel) = 3 and unsigned(my_control_word.Bsel) = 4 and my_control_word.ALUFunc = "1000" report "SUB not working" severity warning;

instruction <= X"007312B3";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 5 and unsigned(my_control_word.Asel) = 6 and unsigned(my_control_word.Bsel) = 7 and my_control_word.ALUFunc = "0001" report "SLL not working" severity warning;

instruction <= X"00A42433";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 8 and unsigned(my_control_word.Asel) = 8 and unsigned(my_control_word.Bsel) = 10 and my_control_word.ALUFunc = "0010" report "SLT not working" severity warning;

instruction <= X"00B534B3";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 9 and unsigned(my_control_word.Asel) = 10 and unsigned(my_control_word.Bsel) = 11 and my_control_word.ALUFunc = "0011" report "SLTU not working" severity warning;

instruction <= X"00D645B3";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 11 and unsigned(my_control_word.Asel) = 12 and unsigned(my_control_word.Bsel) = 13 and my_control_word.ALUFunc = "0100" report "XOR not working" severity warning;

instruction <= X"0107D733";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 14 and unsigned(my_control_word.Asel) = 15 and unsigned(my_control_word.Bsel) = 16 and my_control_word.ALUFunc = "0101" report "SRL not working" severity warning;

instruction <= X"413958B3";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 17 and unsigned(my_control_word.Asel) = 18 and unsigned(my_control_word.Bsel) = 19 and my_control_word.ALUFunc = "1101" report "SRA not working" severity warning;

instruction <= X"016AEA33";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 20 and unsigned(my_control_word.Asel) = 21 and unsigned(my_control_word.Bsel) = 22 and my_control_word.ALUFunc = "0110" report "OR not working" severity warning;

instruction <= X"01AC7BB3";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 23 and unsigned(my_control_word.Asel) = 24 and unsigned(my_control_word.Bsel) = 26 and my_control_word.ALUFunc = "0111" report "AND not working" severity warning;

instruction <= X"F60008E3";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 0 and unsigned(my_control_word.Asel) = 0 and unsigned(my_control_word.Bsel) = 0 and signed(my_control_word.IMM) = -144 and my_control_word.ALUFunc = "0000" report "BRANCH #7 not working" severity warning;

instruction <= X"FB9FF06F";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 0 and my_control_word.ALUFunc = "0000" and signed(my_control_word.IMM) = -72 report "JAL #3 not working" severity warning;

instruction <= X"40010093";
wait for 5 ns;
assert unsigned(my_control_word.Dsel) = 1 and unsigned(my_control_word.Asel) = 2 and signed(my_control_word.IMM) = 1024 and my_control_word.ALUFunc = "0000" report "ADDI #5 not working" severity warning;
wait;
end process;

end Behavioral;

