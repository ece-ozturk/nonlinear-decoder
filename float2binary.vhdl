library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity float2binary is
	port( m_in: in STD_LOGIC_VECTOR(3 downto 0);
			e_in: in STD_LOGIC_VECTOR(2 downto 0);
			binary_result: out STD_LOGIC_VECTOR(11 downto 0)
	);
end float2binary;

architecture structural of float2binary is

component multiply
	port( in1: in STD_LOGIC_VECTOR(7 downto 0);
			in2: in STD_LOGIC_VECTOR(3 downto 0);
			result : out STD_LOGIC_VECTOR(11 downto 0));
end component;

component exponent
	port( in1: in STD_LOGIC_VECTOR(2 downto 0);
			result: out STD_LOGIC_VECTOR(7 downto 0));
end component;

signal mid1: STD_LOGIC_VECTOR(7 downto 0);
signal mid2: STD_LOGIC_VECTOR(11 downto 0);

begin

exponent1: exponent PORT MAP(e_in, mid1);
multiply1: multiply PORT MAP(mid1, m_in, mid2);

binary_result <= mid2;

end structural;

