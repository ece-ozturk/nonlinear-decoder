library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity expansion_decoder is
	port(board_clock : in  STD_LOGIC;
        RESET: in STD_LOGIC := '0';
		  SSEG_CA: out STD_LOGIC_VECTOR(7 downto 0);
		  SSEG_AN: out STD_LOGIC_VECTOR(3 downto 0)
		  );
		  

end expansion_decoder;

architecture structural of expansion_decoder is

component sev_bit_counter
    Port ( board_clock : in  STD_LOGIC;
           --EN : in  STD_LOGIC;
           RSET: in STD_LOGIC := '0';
           M : out  STD_LOGIC_VECTOR (3 downto 0);
			  E : out  STD_LOGIC_VECTOR (2 downto 0));
end component;

component float2binary
	port( m_in: in STD_LOGIC_VECTOR(3 downto 0);
			e_in: in STD_LOGIC_VECTOR(2 downto 0);
			binary_result: out STD_LOGIC_VECTOR(11 downto 0));
end component;


component shift_and_add3
	port(
        binary: in std_logic_vector(11 downto 0);
        bcd0, bcd1, bcd2, bcd3, bcd4: out std_logic_vector(3 downto 0));
end component;

component bcd_7seg
	port ( d: in std_logic_vector (3 downto 0);
	s: out std_logic_vector ( 7 downto 0) );
end component;

component nexys3_sseg_driver
	port( 
		MY_CLK 	: in  STD_LOGIC;
		DIGIT0  : in  STD_LOGIC_VECTOR (7 downto 0);
		DIGIT1  : in  STD_LOGIC_VECTOR (7 downto 0);
		DIGIT2  : in  STD_LOGIC_VECTOR (7 downto 0);
		DIGIT3  : in  STD_LOGIC_VECTOR (7 downto 0);
		SSEG_CA : out STD_LOGIC_VECTOR (7 downto 0);
		SSEG_AN : out STD_LOGIC_VECTOR (3 downto 0)
	);
end component;

signal mid1 : STD_LOGIC_VECTOR(3 downto 0);
signal mid2 : STD_LOGIC_VECTOR(2 downto 0);
signal mid3 : STD_LOGIC_VECTOR(11 downto 0);
signal mid_bcd0, mid_bcd1, mid_bcd2, mid_bcd3, mid_bcd4, an: STD_LOGIC_VECTOR(3 downto 0);
signal s0, s1, s2, s3, s4, ca: STD_LOGIC_VECTOR(7 downto 0);

begin

sev_bit_counter1: sev_bit_counter PORT MAP(board_clock, RESET, mid1, mid2);
float2binary1: float2binary PORT MAP(mid1, mid2, mid3);
shift_and_add3_1: shift_and_add3 PORT MAP(mid3, mid_bcd0, mid_bcd1, mid_bcd2, mid_bcd3, mid_bcd4);
bcd_7seg_0: bcd_7seg PORT MAP(mid_bcd0, s0);
bcd_7seg_1: bcd_7seg PORT MAP(mid_bcd1, s1);
bcd_7seg_2: bcd_7seg PORT MAP(mid_bcd2, s2);
bcd_7seg_3: bcd_7seg PORT MAP(mid_bcd3, s3);
bcd_7seg_4: bcd_7seg PORT MAP(mid_bcd4, s4);
nexys3_sseg_driver_1: nexys3_sseg_driver PORT MAP(board_clock, s0, s1, s2, s3, ca, an);

SSEG_CA <= ca;
SSEG_AN <= an;
 

end structural;

