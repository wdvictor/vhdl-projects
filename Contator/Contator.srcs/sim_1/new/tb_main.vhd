
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity tb_main is
--  Port ( );
end tb_main;

architecture test of tb_main is

    component main is
    Port ( En : in STD_LOGIC;
           Rst : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (0 to 3));
    end component;
    
    signal t_En, t_Rst : std_logic := '0';
    signal t_led :std_logic_vector (3 downto 0) := "0000";


begin
    
    uut : main port map(
       En => t_en,
       Rst => t_Rst,
       led => t_led
    );
    
    
    t_En <= not t_En after 5 ns;
    t_Rst <= '0', '1' after 100 ns, '0' after 150ns;
    
   

end test;
