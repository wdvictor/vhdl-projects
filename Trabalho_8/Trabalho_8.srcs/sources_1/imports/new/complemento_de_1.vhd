library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity complemento_de_1 is
    Port ( cp_in : in STD_LOGIC_VECTOR (3 downto 0);
           cp_SEL : in STD_LOGIC;
           cp_out : out STD_LOGIC_VECTOR (3 downto 0));
end complemento_de_1;

architecture Behavioral of complemento_de_1 is

begin
    
    with cp_SEL select
        cp_out <= cp_in when '0',
                  (not cp_in) when '1',
                  cp_in when others;

end Behavioral;
