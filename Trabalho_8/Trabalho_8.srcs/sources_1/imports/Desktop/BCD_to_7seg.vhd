
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCD_to_7seg is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           LEDS : out STD_LOGIC_VECTOR (6 downto 0);
           point_in : in STD_LOGIC;
           point_out : out STD_LOGIC);
end BCD_to_7seg;

architecture Behavioral of BCD_to_7seg is

begin

WITH point_in select
    point_out <= '1' WHEN '1',
                 '0' WHEN OTHERS;

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
            "1111111" WHEN OTHERS;

end Behavioral;
