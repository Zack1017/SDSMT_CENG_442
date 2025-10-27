library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

use work.control_word_package.all;
use work.rv32i_decode_pkg.all;

entity instruct_decoder is
  Port ( 
    inst : in std_logic_vector(31 downto 0);
    cw : out control_word; 
    illegal : out std_logic
  );
end instruct_decoder;

architecture Behavioral of instruct_decoder is
signal kind : instr_kind_t; 

begin
kind <= classify(inst);
--------------------------------------------------------------------
  -- Simple flags (one-liners)
  --------------------------------------------------------------------
  cw.isBR   <= '1' when (kind = IK_BR or kind = IK_JAL or kind = IK_JALR) else '0';
  cw.PCie   <= '1';                   -- assume PC increments each cycle
  cw.PCle   <= '0';                   -- not driven by decoder
  cw.rst    <= '0';                   -- not driven by decoder
  cw.clk    <= '0';                   -- not driven by decoder
  cw.PCAsel <= '1' when kind = IK_JALR else '0';  -- rs1 as base for JALR target
  illegal   <= '1' when kind = IK_ILLEGAL else '0';

  --------------------------------------------------------------------
  -- Write-enable to RD (Dlen)
  --------------------------------------------------------------------
  with kind select cw.Dlen <=
    '1' when IK_RR | IK_RI | IK_LD | IK_JAL | IK_JALR | IK_LUI | IK_AUIPC,
    '0' when others;

  --------------------------------------------------------------------
  -- Select immediate as ALU B (IMMBsel)
  --------------------------------------------------------------------
  with kind select cw.IMMBsel <=
    '1' when IK_RI | IK_LD | IK_ST | IK_JALR | IK_LUI | IK_AUIPC,
    '0' when others;

  --------------------------------------------------------------------
  -- Use branch/jump target PC path (PCDsel)
  --------------------------------------------------------------------
  with kind select cw.PCDsel <=
    '1' when IK_BR | IK_JAL | IK_JALR,
    '0' when others;

  --------------------------------------------------------------------
  -- Register selects
  -- Asel: rs1 for most except those not needing it
  --------------------------------------------------------------------
  cw.Asel <= get_rs1(inst) when (kind = IK_RR or kind = IK_RI or kind = IK_LD or
                                 kind = IK_ST or kind = IK_BR or kind = IK_JALR)
             else (others => '0');

  -- Bsel: rs2 only for RR and BR (stores use rs2 as data to MEM, not as ALU B when IMMBsel='1')
  cw.Bsel <= get_rs2(inst) when (kind = IK_RR or kind = IK_BR)
             else (others => '0');

  -- Dsel: rd on operations that write back
  cw.Dsel <= get_rd(inst) when (kind = IK_RR or kind = IK_RI or kind = IK_LD or
                                kind = IK_JAL or kind = IK_JALR or
                                kind = IK_LUI or kind = IK_AUIPC)
             else (others => '0');

  --------------------------------------------------------------------
  -- Immediate selection (sign-extended 32-bit)
  --------------------------------------------------------------------
  cw.IMM <= imm_i(inst) when (kind = IK_RI or kind = IK_LD or kind = IK_JALR) else
            imm_s(inst) when (kind = IK_ST) else
            imm_b(inst) when (kind = IK_BR) else
            imm_j(inst) when (kind = IK_JAL) else
            imm_u(inst) when (kind = IK_LUI or kind = IK_AUIPC) else
            (others => '0');

  --------------------------------------------------------------------
  -- ALU function
  --  - RR: map via funct3/funct7
  --  - RI: map via funct3 (and funct7 for shifts)
  --  - LD/ST/LUI/AUIPC/JALR commonly use ADD in the address/compute path
  --------------------------------------------------------------------
  cw.ALUFunc <= alu_from_r(inst) when kind = IK_RR else
                alu_from_i(inst) when kind = IK_RI else
                "0000"           when (kind = IK_LD or kind = IK_ST or
                                       kind = IK_LUI or kind = IK_AUIPC or
                                       kind = IK_JALR) else
                (others => '0');

  --------------------------------------------------------------------
  -- Branch condition encoding (only meaningful for BR)
  --------------------------------------------------------------------
  cw.BRcond <= brcond_from_f3(get_funct3(inst)) when kind = IK_BR else
               (others => '0');


end Behavioral;
