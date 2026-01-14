library ieee;
use ieee.std_logic_1164.all;
library UNISIM;
use UNISIM.VComponents.all;

entity ff_state_bank is
  port (
    clk    : in  std_logic;
    rst    : in  std_logic;
    state_d: in  std_logic_vector(3 downto 0);
    state_q: out std_logic_vector(3 downto 0)
  );
end entity;

architecture structural of ff_state_bank is
begin
  gen_ff : for i in 0 to 3 generate
    ff_i : FDRE
      generic map (
        INIT => '0'   -- power-on default, can set one bit to '1' if you want IDLE="0001"
      )
      port map (
        C  => clk,    -- Clock
        CE => '1',    -- Always enabled
        R  => rst,    -- Async reset (active high)
        D  => state_d(i),
        Q  => state_q(i)
      );
  end generate;
end architecture;
