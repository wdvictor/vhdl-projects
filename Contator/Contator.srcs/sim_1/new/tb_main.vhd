
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity tb_main is
--  Port ( );
end tb_main;

architecture test of tb_main is

    component main
    Port ( JB : in STD_LOGIC_VECTOR (1 downto 0);
           led : out STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           clk : in STD_LOGIC
           );
    end component;
    
    signal TJB : std_logic_vector (1 downto 0) := "00";
    signal tclk: std_logic := '0';
    signal tled: STD_LOGIC_VECTOR (3 downto 0);
    signal tseg: STD_LOGIC_VECTOR (6 downto 0) := "0000000";


begin
    
    uut : main port map(
      JB => TJB,
      led => tled,
      seg => tseg,
      clk => tclk   
    );
    
    tclk <= not tclk after 5 ns;
    TJB(0) <= '0'; --'0' after 200ns, '0' after 250ns;
    TJB(1) <= '0'; -- '0' after 200ns, '0' after 250ns;
    
   
   
   

end test;
