library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.control_word_package.all;  -- must define control_word with IMM, isLOAD, isSTORE

entity data_path is
  port (
    -- Control word from decoder / top
    control      : in  control_word;

    -- Extracted fields from the current instruction (provided by top)
    -- RISC-V funct3 comes from IR(14 downto 12)
    funct3       : in  std_logic_vector(2 downto 0);

    -- ===== Interface to Load/Store Unit (LSU) =====
    ls_addr      : out std_logic_vector(31 downto 0);  -- byte address (rs1 + imm)
    store_data   : out std_logic_vector(31 downto 0);  -- aligned write data (SB/SH/SW)
    store_wstrb  : out std_logic_vector(3 downto 0);   -- byte strobes for SB/SH/SW
    start_load   : out std_logic;                      -- pulse LSU for loads
    start_store  : out std_logic;                      -- pulse LSU for stores
    load_data    : in  std_logic_vector(31 downto 0);  -- returned data from LSU
    ls_ready     : in  std_logic;                      -- LSU done
    isLOAD  : in std_logic;
    isSTORE : in std_logic;


    -- Stall indicator to gate PC increment in the top
    mem_busy     : out std_logic;

    -- Expose current PC to fetch/top
    pc_val       : out std_logic_vector(31 downto 0)
  );
end entity data_path;

architecture Behavioral of data_path is
  --------------------------------------------------------------------------
  -- <<< REPLACE THESE THREE with your real datapath signals >>>
  -- rs1_val: source register 1 value (ALU base for address calc)
  -- rs2_val: source register 2 value (store data)
  -- pc_out : current PC value driven by your PC unit
  --------------------------------------------------------------------------
  signal rs1_val  : std_logic_vector(31 downto 0) := (others => '0');  -- <<< REPLACE
  signal rs2_val  : std_logic_vector(31 downto 0) := (others => '0');  -- <<< REPLACE
  signal pc_out   : std_logic_vector(31 downto 0) := (others => '0');  -- <<< REPLACE

  --------------------------------------------------------------------------
  -- Internal LSU glue
  --------------------------------------------------------------------------
  signal ls_addr_i : std_logic_vector(31 downto 0);
  signal byte_off  : std_logic_vector(1 downto 0);
  signal half_off  : std_logic;

  -- Load writeback helpers
  signal ld_byte   : std_logic_vector(7 downto 0);
  signal ld_half   : std_logic_vector(15 downto 0);
  signal ld_ext    : std_logic_vector(31 downto 0);

  --------------------------------------------------------------------------
  -- Helper: left shift a std_logic_vector by integer amount (fills with 0)
  --------------------------------------------------------------------------
  function sll32(x : std_logic_vector(31 downto 0); sh : integer)
    return std_logic_vector is
    variable t : std_logic_vector(31 downto 0) := (others => '0');
  begin
    if sh >= 0 and sh <= 31 then
      t := std_logic_vector(shift_left(unsigned(x), sh));
    end if;
    return t;
  end function;

begin
  --------------------------------------------------------------------------
  -- PC visibility to top/fetch
  --------------------------------------------------------------------------
  pc_val <= pc_out;  -- <<< REPLACE pc_out with your existing PC signal

  --------------------------------------------------------------------------
  -- Address calculation for memory ops: rs1 + IMM (byte address)
  --------------------------------------------------------------------------
  ls_addr_i <= std_logic_vector( signed(rs1_val) + signed(control.IMM) );
  ls_addr   <= ls_addr_i;  -- never read from OUT; use internal ls_addr_i

  -- Lane selects from address
  byte_off <= ls_addr_i(1 downto 0);
  half_off <= ls_addr_i(1);

  --------------------------------------------------------------------------
  -- WSTRB generation for stores (RV32I: funct3 000=SB, 001=SH, 010=SW)
  --------------------------------------------------------------------------
  store_wstrb <=
  -- SB: one byte, lane selected by byte_off
  std_logic_vector( shift_left(to_unsigned(1, 4), to_integer(unsigned(byte_off))) )  when funct3 = "000" else
  -- SH: two bytes, lanes selected by half_off (bit 1 of address)
  std_logic_vector'( (3 downto 2 => half_off, 1 downto 0 => not half_off) )         when funct3 = "001" else
  -- SW: all four bytes
  "1111"                                                                             when funct3 = "010" else
  (others => '0');




  --------------------------------------------------------------------------
  -- Aligned store data
  -- SB: replicate byte into LSB then shift into lane
  -- SH: replicate halfword into LSB then shift into lane
  -- SW: full 32b word
  --------------------------------------------------------------------------
  store_data <=
    sll32( (31 downto 8  => '0') & rs2_val(7 downto 0),
           8*to_integer(unsigned(byte_off)) )               when funct3 = "000" else
    sll32( (31 downto 16 => '0') & rs2_val(15 downto 0),
           (32) when half_off = '1' else (0) )        when funct3 = "001" else
    rs2_val;

  --------------------------------------------------------------------------
  -- Fire LSU for mem ops (combinational)
  --------------------------------------------------------------------------
  start_load  <= isLOAD;
  start_store <= isSTORE;

  mem_busy <= '1'
    when ((isLOAD = '1') or (isSTORE = '1')) and (ls_ready = '0')
    else '0';


  --------------------------------------------------------------------------
  -- Load data sign/zero extend for writeback (RV32I)
  -- LB=000, LH=001, LW=010, LBU=100, LHU=101
  --------------------------------------------------------------------------
  with byte_off select
    ld_byte <= load_data(7 downto 0)    when "00",
               load_data(15 downto 8)   when "01",
               load_data(23 downto 16)  when "10",
               load_data(31 downto 24)  when others;

  ld_half <= load_data(15 downto 0) when half_off = '0'
             else load_data(31 downto 16);

  ld_ext <=
    (31 downto 8  => ld_byte(7))  & ld_byte    when funct3 = "000" else -- LB
    (31 downto 16 => ld_half(15)) & ld_half    when funct3 = "001" else -- LH
    load_data                                      when funct3 = "010" else -- LW
    (31 downto 8  => '0') & ld_byte            when funct3 = "100" else -- LBU
    (31 downto 16 => '0') & ld_half            when funct3 = "101" else -- LHU
    (others => '0');

  --------------------------------------------------------------------------
  -- <<< REPLACE THIS WITH YOUR EXISTING WRITEBACK MUX >>>
  -- Example:
  -- wb_data <= ld_ext when control.isLOAD='1' else <other_sources>;
  -- (This file leaves writeback selection to your existing datapath.)
  --------------------------------------------------------------------------

end architecture Behavioral;
