library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.decoder_pkg.all;

entity register_file is
    Generic (XLen : integer := 32);
    Port ( Asel : in STD_LOGIC_VECTOR (4 downto 0); --TODO make these generic
           Bsel : in STD_LOGIC_VECTOR (4 downto 0);
           Dsel : in STD_LOGIC_VECTOR (4 downto 0);
           Dlen : in STD_LOGIC;
           Abus : out STD_LOGIC_VECTOR (XLen-1 downto 0);
           Bbus : out STD_LOGIC_VECTOR (XLen-1 downto 0);
           Dbus : in STD_LOGIC_VECTOR (XLen-1 downto 0);
           clk : in STD_LOGIC;
           res : in STD_LOGIC);
end register_file;

architecture Behavioral of register_file is
    type registerOutput is array (XLen-1 downto 0) of std_logic_vector(XLen - 1 downto 0);
    signal decodeDsel: std_logic_vector(XLen - 1 downto 0);
    signal regOut: registerOutput;
begin
    decodeDsel <= decode(Dsel, Dlen);
    
    regOut(0) <= (others => '0');
    
    regGen : For I in XLen - 1 downto 1 generate
        regI: entity work.generic_register (behavioral)
            generic map (N => XLen )
            port map ( din => Dbus, dout => regOut (I), clk => clk, res => res, en => decodeDsel(I));
    end generate;
    
    Abus <= regOut(to_integer(unsigned(Asel)));
    Bbus <= regOut(to_integer(unsigned(Bsel)));
end Behavioral;
