library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

package decoder is
     function decode(selected: std_logic_vector; enable: std_logic)
        return std_logic_vector;
end decoder;


package body decoder is

    function decode(selected: std_logic_vector; enable: std_logic)
        return std_logic_vector is
            variable decoded : std_logic_vector((2**selected'length)-1 downto 0);
            begin
                decoded := (others => '0');
                decoded(to_integer(unsigned(selected))) := enable;
                return decoded;
            end function;

end decoder;