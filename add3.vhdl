----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:07:19 05/03/2023 
-- Design Name: 
-- Module Name:    add3 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity add3 is
	port( in1: in STD_LOGIC_VECTOR(3 downto 0);
			out1: out STD_LOGIC_VECTOR(3 downto 0));
end add3;

architecture Behavioral of add3 is

signal three, four: STD_LOGIC_VECTOR(3 downto 0);

begin

three <= "0011";
four <= "0100";

process(in1) is
begin

	if (in1 > four) then out1 <= std_logic_vector( unsigned(in1) + unsigned(three));
	else out1 <= in1;
	end if;
	
end process;

end Behavioral;

