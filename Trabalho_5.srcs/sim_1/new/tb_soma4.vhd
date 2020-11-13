library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_soma4 is
--  Port ( );
end tb_soma4;

architecture Behavioral of tb_soma4 is

    component soma4
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               CIN : in STD_LOGIC;
               SEL : in STD_LOGIC;
               S : out STD_LOGIC_VECTOR (3 downto 0);
               COUT : out STD_LOGIC);
    end component;
    
    signal s_A, s_B, s_S: STD_LOGIC_VECTOR (3 downto 0);
    signal s_SEL, s_CIN, s_COUT: STD_LOGIC;

begin

    uuu: soma4 port map ( A=>s_A, B=>s_B, CIN=>s_CIN, SEL=>s_SEL, S=>s_S, COUT=>s_COUT );
    
    stimulus: process
    begin
        
        s_A <= "0010"; s_B <= "0011"; s_CIN <= '0'; s_SEL <= '0';
        wait for 10ns;
        
        s_A <= "0110"; s_B <= "0101"; s_CIN <= '0'; s_SEL <= '0';
        wait for 10ns;
        
        s_A <= "0101"; s_B <= "1110"; s_CIN <= '0'; s_SEL <= '0';
        wait for 10ns;
        
        s_A <= "0010"; s_B <= "1001"; s_CIN <= '0'; s_SEL <= '0';
        wait for 10ns;
        
        s_A <= "1101"; s_B <= "0011"; s_CIN <= '0'; s_SEL <= '0';
        wait for 10ns;
        
        s_A <= "0100"; s_B <= "0000"; s_CIN <= '0'; s_SEL <= '0';
        wait for 10ns;
        
        s_A <= "1111"; s_B <= "0111"; s_CIN <= '0'; s_SEL <= '0';
        wait for 10ns;
        
        s_A <= "1011"; s_B <= "0011"; s_CIN <= '0'; s_SEL <= '0';
        wait for 10ns;
        
        s_A <= "1001"; s_B <= "0000"; s_CIN <= '0'; s_SEL <= '0';
        wait for 10ns;
        
        s_A <= "1101"; s_B <= "1111"; s_CIN <= '0'; s_SEL <= '0';
        wait for 10ns;
        
        s_A <= "1011"; s_B <= "1010"; s_CIN <= '0'; s_SEL <= '0';
        wait for 10ns;
        
        s_A <= "0101"; s_B <= "0011"; s_CIN <= '0'; s_SEL <= '1';
        wait for 10ns;
        
        s_A <= "0101"; s_B <= "0110"; s_CIN <= '0'; s_SEL <= '1';
        wait for 10ns;
        
        s_A <= "0001"; s_B <= "0000"; s_CIN <= '0'; s_SEL <= '1';
        wait for 10ns;
        
        s_A <= "0101"; s_B <= "1110"; s_CIN <= '0'; s_SEL <= '1';
        wait for 10ns;
        
        s_A <= "0111"; s_B <= "1101"; s_CIN <= '0'; s_SEL <= '1';
        wait for 10ns;
        
        s_A <= "1011"; s_B <= "0001"; s_CIN <= '0'; s_SEL <= '1';
        wait for 10ns;
        
        s_A <= "1010"; s_B <= "0111"; s_CIN <= '0'; s_SEL <= '1';
        wait for 10ns;
        
        s_A <= "1011"; s_B <= "1000"; s_CIN <= '0'; s_SEL <= '1';
        wait for 10ns;
        
        s_A <= "1001"; s_B <= "1100"; s_CIN <= '0'; s_SEL <= '1';
        wait for 10ns;
        
        s_A <= "1110"; s_B <= "1110"; s_CIN <= '0'; s_SEL <= '1';
        wait for 10ns;
        
        s_A <= "1000"; s_B <= "0000"; s_CIN <= '0'; s_SEL <= '1';
        wait for 10ns;
        
        wait;
    end process;

end Behavioral;
