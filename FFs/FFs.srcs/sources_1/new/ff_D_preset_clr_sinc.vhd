

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ff_D_preset_clr_sinc is
    Port ( D : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Q_not : out STD_LOGIC;
           preset : in STD_LOGIC;
           clr : in STD_LOGIC);
end ff_D_preset_clr_sinc;

architecture Behavioral of ff_D_preset_clr_sinc is

signal qt : STD_LOGIC ;
begin
    
    Q <= qt;
    Q_not <= not qt;
    
    ffD : process(clk)
    begin
        if rising_edge(clk) then
        --Como esse � um flip-flop D � to tipo sincrono, ele espera o clk subir para
        --verificar as sa�das. Para evitar o estado de 'disallowed'(nao-permitido) que
        --no caso � preset = 0 e clear = 0, vamos verificar primeiro se
        -- o clear � 1, fazendo assim a sa�da igual a 0 (limpando a sa�da).
            if clr='1' then
                qt <= '0';
            elsif preset='1' then
                qt <= '1';
            else
                qt <= D;
            end if;
           end if;
    end process;

end Behavioral;