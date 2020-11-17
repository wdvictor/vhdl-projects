library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity overflow is
    Port ( of_a : in STD_LOGIC;
           of_b : in STD_LOGIC;
           of_s : in STD_LOGIC;
           of_out : out STD_LOGIC);
end overflow;

architecture Behavioral of overflow is

    signal aux: STD_LOGIC;

begin

    aux <= of_a xor of_b;

    with aux select
        of_out <= (of_a xor of_s) when '0',
                  '0' when others;

end Behavioral;
