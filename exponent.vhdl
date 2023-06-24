library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity exponent is
	port( in1: in STD_LOGIC_VECTOR(2 downto 0);
			result: out STD_LOGIC_VECTOR(7 downto 0));
end exponent;

architecture dataflow of exponent is

begin

process(in1) is
begin

case in1 is
	when "000" => result <= "00000001";
	when "001" => result <= "00000010";
	when "010" => result <= "00000100";
	when "011" => result <= "00001000";
	when "100" => result <= "00010000";
	when "101" => result <= "00100000";
	when "110" => result <= "01000000";
	when others => result <= "10000000";
end case;


end process;

end dataflow;