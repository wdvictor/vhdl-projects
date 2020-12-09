
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ff_D_clr is
    Port ( D : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Q_not : out STD_LOGIC;
           clr : in STD_LOGIC);
end ff_D_clr;

architecture Behavioral of ff_D_clr is
    signal qt : STD_LOGIC ;
begin
    
    Q <= qt;
    Q_not <= not qt;
  
      
    --Como esse é um flip-flop do tipo assincróno, tanto o clk
    --quanto o clr acionam o process
    ffD : process(clk , clr)
    begin
        if clr='1' then
            qt <= '1';
        elsif falling_edge(clk) then
            qt <= D;
        end if;
    end process;

end Behavioral;
