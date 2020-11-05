library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_BCD_to_7seg is
--  Port ( );
end tb_BCD_to_7seg;

architecture Behavioral of tb_BCD_to_7seg is

    component BCD_to_7seg
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           LEDS : out STD_LOGIC_VECTOR (6 downto 0));
    end component;
    
    signal s_A: STD_LOGIC_VECTOR (3 downto 0);
    signal s_LEDS: STD_LOGIC_VECTOR (6 downto 0);

begin

    uuu: BCD_to_7seg port map ( A=>s_A, LEDS=>s_LEDS );
    
    stimulus: process
    begin
        
        s_A <= "0000";
        wait for 10ns;
        
        s_A <= "0001";
        wait for 10ns;
        
        s_A <= "0010";
        wait for 10ns;
        
        s_A <= "0011";
        wait for 10ns;
        
        s_A <= "0100";
        wait for 10ns;
        
        s_A <= "0101";
        wait for 10ns;
        
        s_A <= "0110";
        wait for 10ns;
        
        s_A <= "0111";
        wait for 10ns;
        
        s_A <= "1000";
        wait for 10ns;
        
        s_A <= "1001";
        wait for 10ns;
        
        wait;
    end process;

end Behavioral;
