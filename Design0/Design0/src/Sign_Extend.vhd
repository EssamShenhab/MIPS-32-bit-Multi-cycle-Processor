library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SignExtend is
    port (
        input16  : in  std_logic_vector(15 downto 0);
        output32 : out std_logic_vector(31 downto 0)
    );
end entity;

architecture rtl of SignExtend is
begin
    output32 <= "0000000000000000" & input16 when (input16(15) = '0') else
                "1111111111111111" & input16;
end architecture;
