
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC);
end mux4;

architecture Behavioral of mux4 is

begin

  WITH sel select 
    S <= A WHEN '0',
         B WHEN '1',
         C WHEN OTHERS;
    
end Behavioral;
