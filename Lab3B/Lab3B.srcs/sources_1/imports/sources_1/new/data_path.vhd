----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/12/2025 01:13:46 PM
-- Design Name: 
-- Module Name: data_path - Behavioral
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
use work.control_word_package.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity data_path is
  Port ( 
  control : in control_word;
  pc_val  : out std_logic_vector(31 downto 0)
  );
end data_path;

architecture Behavioral of data_path is

signal D_bus, a, b, alu_out, pc_out, a_bus, b_bus : std_logic_vector(31 downto 0);
signal take_branch, pc_active : std_logic; 

component generic_register_file
    generic (
            N : integer := 32
        );
    port(
        Asel : in STD_LOGIC_VECTOR (4 downto 0);
        Bsel : in STD_LOGIC_VECTOR (4 downto 0);
        Dsel : in STD_LOGIC_VECTOR (4 downto 0);
        Din : in STD_LOGIC_VECTOR (N-1 downto 0);
        Den : in STD_LOGIC;
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        a : out STD_LOGIC_VECTOR (N-1 downto 0);
        b : out STD_LOGIC_VECTOR (N-1 downto 0)
    );
end component;

component BTU
    port (
        BRcond : in STD_LOGIC_VECTOR (2 downto 0);
        isBR : in STD_LOGIC;
        a : in STD_LOGIC_VECTOR (31 downto 0);
        b : in STD_LOGIC_VECTOR (31 downto 0);
        take_branch : out STD_LOGIC
    );
end component; 

component pc 
    port(
        clk : in std_logic;
        aluOut : in STD_LOGIC_VECTOR (31 downto 0);
        PCLE_BTU : in STD_LOGIC;
        PCie : in STD_LOGIC;
        reset: in STD_LOGIC;
        pcOut : out STD_LOGIC_VECTOR (31 downto 0)
    );
end component;

component alu
    port(
        a : in STD_LOGIC_VECTOR (31 downto 0);
        b : in STD_LOGIC_VECTOR (31 downto 0);
        ALUfunc : in STD_LOGIC_VECTOR (3 downto 0);
        aluOut : out STD_LOGIC_VECTOR (31 downto 0)
    );
end component; 

begin

register_file : generic_register_file
    port map (
        Asel => control.Asel,
        Bsel => control.Bsel,
        Dsel => control.Dsel, 
        Din => D_bus,
        Den => control.dlen,
        clk => control.clk, 
        reset => control.rst, 
        a => a, 
        b => b
    );

branch_test_unit : BTU
    port map(
        BRcond => control.BRcond, 
        isBR => control.isBR, 
        a => a, 
        b => b,
        take_branch => take_branch
    );
    
program_counter: pc
    port map(
        clk => control.clk, 
        aluOut => alu_out, 
        PCLE_BTU => pc_active, 
        PCie => control.PCie, 
        reset => control.rst, 
        pcOut => pc_out
    );
    
arithmetic_logic_unit : alu
    port map(
        a => a_bus, 
        b => b_bus,
        ALUfunc => control.ALUfunc, 
        aluOut => alu_out
    );

--Logic 
pc_active <= take_branch or control.PCle;

a_bus <= a when control.PCAsel = '0' else
    pc_out;
b_bus <= b when control.IMMBsel = '0' else
    control.IMM;
    
D_bus <= alu_out when control.PCDsel = '0' else
    pc_out;
    
pc_val <= pc_out;

end Behavioral;
