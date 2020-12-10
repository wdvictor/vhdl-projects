-- Codigo importado de um decodificador BCD para 7seg
-- Porem esse codigo eh um decodificador Hexadecimal para 7seg
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCD_to_7seg is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           LEDS : out STD_LOGIC_VECTOR (6 downto 0));
end BCD_to_7seg;

architecture Behavioral of BCD_to_7seg is

begin

WITH A select 
    LEDS <= "0000001" WHEN "0000", -- 0
            "1001111" WHEN "0001", -- 1
            "0010010" WHEN "0010", -- 2
            "0000110" WHEN "0011", -- 3
            "1001100" WHEN "0100", -- 4
            "0100100" WHEN "0101", -- 5
            "0100000" WHEN "0110", -- 6
            "0001111" WHEN "0111", -- 7
            "0000000" WHEN "1000", -- 8
            "0000100" WHEN "1001", -- 9
            "0001000" WHEN "1010", -- A
            "1100000" WHEN "1011", -- b
            "0110001" WHEN "1100", -- C
            "1000010" WHEN "1101", -- d
            "0110000" WHEN "1110", -- E
            "0111000" WHEN "1111", -- F
            "1111111" WHEN OTHERS;

end Behavioral;
