----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:22:59 05/03/2023 
-- Design Name: 
-- Module Name:    bcd_7seg - dataflow 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bcd_7seg is
	port ( d: in std_logic_vector (3 downto 0);
	s: out std_logic_vector ( 7 downto 0) );
end bcd_7seg;

architecture dataflow of bcd_7seg is

begin

with d select
	s <="11000000" when "0000",
	"11111001" when "0001",
	"10100100" when "0010",
	"10110000" when "0011", 
	"10011001" when "0100", 
	"10010010" when "0101", 
	"10000010" when "0110",
	"11111000" when "0111", 
	"10000000" when "1000", 
	"10010000" when "1001", 
	"11111111" when others;
	
end dataflow;

