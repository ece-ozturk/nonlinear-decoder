library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity sev_bit_counter is
    Port ( board_clock : in  STD_LOGIC;
           --EN : in  STD_LOGIC;
           RSET: in STD_LOGIC := '0';
           M : out  STD_LOGIC_VECTOR (3 downto 0);
			  E : out  STD_LOGIC_VECTOR (2 downto 0));
end sev_bit_counter;



architecture structural of sev_bit_counter is


component our_counter
    port (board_clock: IN STD_LOGIC;
			enable: IN STD_LOGIC;
			reset: IN STD_LOGIC;
			q : OUT STD_LOGIC_VECTOR(6 downto 0));
end component;


component freq_divider
	port (our_clock : in STD_LOGIC;
			clock_enable : out STD_LOGIC);
end component;

signal fp1, fp2, fp3, fp4, fp5, fp6, fp7, mid_e: STD_LOGIC;
signal vec :  STD_LOGIC_VECTOR(7 downto 0);


begin

our_freq_divider: freq_divider PORT MAP(board_clock, mid_e);
counter: our_counter PORT MAP(q(0)=>fp1, q(1)=>fp2, q(2)=>fp3, q(3)=>fp4, q(4)=>fp5, q(5)=>fp6, q(6)=>fp7, reset=>RSET, board_clock=>board_clock, enable=>mid_e);


M(0) <= fp1;
M(1) <= fp2;
M(2) <= fp3;

M(3) <= fp4;

E(0) <= fp5;
E(1) <= fp6;
E(2) <= fp7;

end structural;