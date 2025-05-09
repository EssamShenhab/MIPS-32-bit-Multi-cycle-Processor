
-- Project: MIPS32 multi-cycle
-- Module:  Mux 2 inputs 32 bit

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Mux2_32 is
	port(
	--input
	input_1   : in std_logic_vector(31 downto 0);
	input_2   : in std_logic_vector(31 downto 0);
	mux_select: in std_logic;
	
	--output
	output    :	out std_logic_vector(31 downto 0)	
	);
end Mux2_32;

architecture Behavioral of Mux2_32 is
begin 
	with mux_select select
	output <= input_1 when '0',
	          input_2 when others;
end Behavioral;