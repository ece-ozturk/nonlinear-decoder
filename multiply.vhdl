library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity multiply is
	port( in1: in STD_LOGIC_VECTOR(7 downto 0);
			in2: in STD_LOGIC_VECTOR(3 downto 0);
			result : out STD_LOGIC_VECTOR(11 downto 0));
end multiply;

architecture dataflow of multiply is

signal two: STD_LOGIC_VECTOR(1 downto 0) := "10";

begin

process(in1, in2) is
begin
	result <= std_logic_vector(unsigned(in1) * unsigned(in2));
end process;
end dataflow;

