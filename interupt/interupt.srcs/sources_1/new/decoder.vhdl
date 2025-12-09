library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.RISCV_package.all;

entity decoder is
    Port ( instruction : in STD_LOGIC_VECTOR (31 downto 0);
           CW : out control_word);
end decoder;

architecture Behavioral of decoder is
    signal r_cw : control_word;
    signal i_cw : control_word;
    signal load_cw : control_word;
    signal s_cw : control_word;
    signal b_cw : control_word;
    signal u_cw : control_word;
    signal j_cw : control_word;
    signal empty_cw : control_word;
    signal instr_type : op_type;
begin
    --decode opcode
    --get instruction if needed
    --CW <= input(x downto y)
    instr_type <= get_op_type(instruction(6 downto 0));
    
    r_cw <= handle_r_type(instruction);
    i_cw <= handle_i_type(instruction);
    load_cw <= handle_load_type(instruction);
    s_cw <= handle_s_type(instruction);
    b_cw <= handle_b_type(instruction);
    u_cw <= handle_u_type(instruction);
    j_cw <= handle_j_type(instruction);

    empty_cw <= (
        Asel    => (others => '0'),
        Bsel    => (others => '0'),
        Dsel    => (others => '0'),
        Dlen    => '0',
        PCAsel  => '0',
        PCAUsel => '0',
        IMMBsel => '0',
        PCDsel  => '0',
        PCie    => '0',
        PCle    => '0',
        isBR    => '0',
        isLoad => '0',
        isStore => '0',
        BRcond  => (others => '0'),
        ALUFunc => (others => '0'),
        IMM     => (others => '0')
    );
    
    with (instr_type) select
        CW <= r_cw when r_type,
              i_cw when i_type,
              load_cw when load_type,
              s_cw when s_type,
              b_cw when b_type,
              u_cw when u_type,
              j_cw when j_type,
          empty_cw when illegal,
          empty_cw when others;

    --with type select 
end Behavioral;
