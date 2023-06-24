library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

use IEEE.NUMERIC_STD.ALL;

entity our_counter is
	PORT (board_clock: IN STD_LOGIC;
			enable: IN STD_LOGIC;
			reset: IN STD_LOGIC;
			q : OUT STD_LOGIC_VECTOR(6 downto 0));
end our_counter;

architecture Behavioral of our_counter is

signal mid_q: integer range 0 to 127;
--signal mid2_q : STD_LOGIC_VECTOR(5 downto 0);

begin

COUNTER: process (board_clock, reset)
begin
	if (reset = '1') then 
		mid_q <= 0;
	elsif (rising_edge(board_clock)) then
	
		if (enable = '1') then
			if (mid_q = 127) then
				mid_q <= 0;
			else
				mid_q <= mid_q + 1;
			end if;
		end if;
	end if;
--mid2_q <= std_logic_vector( to_unsigned(mid_q, 6) );
	
end process;
	
--q <= mid2_q;
q <= std_logic_vector( to_unsigned(mid_q, 7) );


end Behavioral;

