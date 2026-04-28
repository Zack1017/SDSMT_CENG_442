library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

package rv32i_decode_pkg is
--Opcodes (RV32I)
constant OPC_OP : std_logic_vector(6 downto 0) := "0110011"; --R
constant OPC_OP_IMM : std_logic_vector(6 downto 0) := "0010011"; --I(alu)
constant OPC_LOAD : std_logic_vector(6 downto 0) := "0000011"; -- I(ld)
constant OPC_STORE : std_logic_vector(6 downto 0) := "0100011"; --S
constant OPC_BRANCH : std_logic_vector(6 downto 0) := "1100011"; --B
constant OPC_LUI : std_logic_vector(6 downto 0) := "0110111"; --U
constant OPC_AUIPC : std_logic_vector(6 downto 0) := "0010111"; --U
constant OPC_JAL : std_logic_vector(6 downto 0) := "1101111"; --J
constant OPC_JALR : std_logic_vector(6 downto 0) := "1100111"; --I(jalr)
constant OPC_SYSTEM : std_logic_vector(6 downto 0) := "1110011"; --system 
constant OPC_FENCE : std_logic_vector(6 downto 0) := "0001111"; -- fence 

--Instruction kind 
type instr_kind_t is (IK_RR, IK_RI, IK_LD, IK_ST, IK_BR, IK_JAL, IK_JALR, IK_LUI, IK_AUIPC, IK_SYS, IK_FENCE, IK_ILLEGAL);

--Extract fields
function get_opcode(inst : std_logic_vector(31 downto 0)) return std_logic_vector; 
function get_funct3(inst : std_logic_vector(31 downto 0)) return std_logic_vector;
function get_funct7(inst : std_logic_vector(31 downto 0)) return std_logic_vector;
function get_rs1(inst : std_logic_vector(31 downto 0)) return std_logic_vector;
function get_rs2(inst : std_logic_vector(31 downto 0)) return std_logic_vector;
function get_rd(inst : std_logic_vector(31 downto 0)) return std_logic_vector; 

--Imm Generators 
function imm_i(inst : std_logic_vector(31 downto 0)) return std_logic_vector; 
function imm_s(inst : std_logic_vector(31 downto 0)) return std_logic_vector; 
function imm_b(inst : std_logic_vector(31 downto 0)) return std_logic_vector; 
function imm_u(inst : std_logic_vector(31 downto 0)) return std_logic_vector; 
function imm_j(inst : std_logic_vector(31 downto 0)) return std_logic_vector; 

--Helpers 
function classify(inst : std_logic_vector(31 downto 0)) return instr_kind_t;
subtype slv4 is std_logic_vector(3 downto 0);
subtype slv3 is std_logic_vector(2 downto 0);
function alu_from_r(inst : std_logic_vector(31 downto 0)) return slv4;
function alu_from_i(inst : std_logic_vector(31 downto 0)) return slv4;
function brcond_from_f3(f3  : std_logic_vector(2 downto 0)) return slv3;

end rv32i_decode_pkg;

package body rv32i_decode_pkg is

function get_opcode(inst : std_logic_vector(31 downto 0)) return std_logic_vector is 
begin 
    return inst(6 downto 0);
end; 

function get_funct3(inst : std_logic_vector(31 downto 0)) return std_logic_vector is 
begin 
    return inst(14 downto 12);
end;

function get_funct7(inst : std_logic_vector(31 downto 0)) return std_logic_vector is 
begin
    return inst(31 downto 25);
end; 

function get_rs1(inst : std_logic_vector(31 downto 0)) return std_logic_vector is 
begin
    return inst(19 downto 15); 
end; 

function get_rs2(inst : std_logic_vector(31 downto 0)) return std_logic_vector is 
begin 
    return inst(24 downto 20);
end; 

function get_rd(inst : std_logic_vector(31 downto 0)) return std_logic_vector is 
begin 
    return inst(11 downto 7);
end; 

--sign help 
function sext(val : std_logic_vector) return std_logic_vector is
    variable r : signed(31 downto 0);
  begin
    r := resize(signed(val), 32);
    return std_logic_vector(r);
  end;
    
function imm_i(inst : std_logic_vector(31 downto 0)) return std_logic_vector is 
begin 
    return sext(inst(31 downto 20)); 
end;

function imm_s(inst : std_logic_vector(31 downto 0)) return std_logic_vector is 
    variable s : std_logic_vector(11 downto 0); 
    begin 
        s := inst(31 downto 25) & inst(11 downto 7); 
        return sext(s);
    end; 

function imm_b(inst : std_logic_vector(31 downto 0)) return std_logic_vector is 
    variable b : std_logic_vector (12 downto 0); 
    begin 
        b := inst(31) & inst(7) & inst(30 downto 25) & inst(11 downto 8) & '0'; 
        return sext(b); 
    end; 
    
function imm_u(inst : std_logic_vector(31 downto 0)) return std_logic_vector is 
begin
    return inst(31 downto 12) & (11 downto 0 => '0'); 
end; 

function imm_j(inst : std_logic_vector(31 downto 0)) return std_logic_vector is 
variable j: std_logic_vector(20 downto 0); 
begin 
    j := inst(31) & inst(19 downto 12) & inst(20) & inst( 30 downto 21) & '0';
    return sext(j); 
end; 

function classify(inst : std_logic_vector(31 downto 0)) return instr_kind_t is 
    variable opc: std_logic_vector(6 downto 0) := get_opcode(inst); 
    begin 
        if opc = OPC_OP then return IK_RR; 
        elsif opc = OPC_OP_IMM then return IK_RI; 
        elsif opc = OPC_LOAD then return IK_LD; 
        elsif opc = OPC_STORE then return IK_ST; 
        elsif opc = OPC_BRANCH then return IK_BR; 
        elsif opc = OPC_LUI then return IK_LUI; 
        elsif opc = OPC_AUIPC then return IK_AUIPC;
        elsif opc = OPC_JAL then return IK_JAL; 
        elsif opc = OPC_JALR then return IK_JALR; 
        elsif opc = OPC_SYSTEM then return IK_SYS; 
        elsif opc = OPC_FENCE then return IK_FENCE; 
        else return IK_ILLEGAL; 
        end if;
     end; 
 
 --Replace ALU encoding 
 function alu_from_r(inst : std_logic_vector(31 downto 0)) return slv4 is
  variable f3 : std_logic_vector(2 downto 0) := get_funct3(inst);
  variable f7 : std_logic_vector(6 downto 0) := get_funct7(inst);
begin
  -- TODO: put your real encodings here
  if    f3 = "000" and f7 = "0000000" then return "0000"; -- ADD
  elsif f3 = "000" and f7 = "0100000" then return "0001"; -- SUB
  elsif f3 = "111"                    then return "0010"; -- AND
  elsif f3 = "110"                    then return "0011"; -- OR
  elsif f3 = "100"                    then return "0100"; -- XOR
  elsif f3 = "001"                    then return "0101"; -- SLL
  elsif f3 = "101" and f7 = "0000000" then return "0110"; -- SRL
  elsif f3 = "101" and f7 = "0100000" then return "0111"; -- SRA
  elsif f3 = "010"                    then return "1000"; -- SLT
  elsif f3 = "011"                    then return "1001"; -- SLTU
  else                                     return "0000";
  end if;
end;

function alu_from_i(inst : std_logic_vector(31 downto 0)) return slv4 is
  variable f3 : std_logic_vector(2 downto 0) := get_funct3(inst);
  variable f7 : std_logic_vector(6 downto 0) := get_funct7(inst);
begin
  if    f3 = "000"                    then return "0000"; -- ADDI
  elsif f3 = "111"                    then return "0010"; -- ANDI
  elsif f3 = "110"                    then return "0011"; -- ORI
  elsif f3 = "100"                    then return "0100"; -- XORI
  elsif f3 = "001"                    then return "0101"; -- SLLI
  elsif f3 = "101" and f7 = "0000000" then return "0110"; -- SRLI
  elsif f3 = "101" and f7 = "0100000" then return "0111"; -- SRAI
  elsif f3 = "010"                    then return "1000"; -- SLTI
  elsif f3 = "011"                    then return "1001"; -- SLTIU
  else                                     return "0000";
  end if;
end;

function brcond_from_f3(f3 : std_logic_vector(2 downto 0)) return slv3 is
begin
  -- If your branch unit uses funct3 directly, just pass it through:
  return f3;
end;

end package body;

