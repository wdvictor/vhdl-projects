

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity main is
    Port (
       clk: in STD_LOGIC;
       ff_assinc_D : in STD_LOGIC;
       ff_assinc_clr : in STD_LOGIC;
       ff_assinc_Q: out STD_LOGIC;
       led : out std_logic_vector (3 downto 0) 
         );

end main;

architecture Behavioral of main is
    
 
    component ff_D_preset_clr_assinc
        Port ( D : in STD_LOGIC;
               clk : in STD_LOGIC;
               Q : out STD_LOGIC;
               clr : in STD_LOGIC);
    end component;

    signal q_out0 : std_logic;
    signal q_out1 : std_logic;
    signal q_out2 : std_logic;
    signal q_out3 : std_logic;
--    signal q_out4 : std_logic;
--    signal q_out5 : std_logic;
--    signal q_out6 : std_logic;
--    signal q_out7 : std_logic;
--    signal q_out8 : std_logic;
--    signal q_out9 : std_logic;
--    signal q_out10 : std_logic;
--    signal q_out11 : std_logic;
--    signal q_out12 : std_logic;
--    signal q_out13 : std_logic;
--    signal q_out14 : std_logic;
--    signal q_out15 : std_logic;
    

begin
    ---Nesse trabalho de registradores, será usado apenas o reset, sendo
    ---o preset q o Q_not não necessários.
    ff_assinc0 : ff_D_preset_clr_assinc port map(
        D => ff_assinc_D,
        clk => clk,
        Q => q_out0,
        clr => ff_assinc_clr
    ); 
    
    ---O signal q_out0 segura a saída do primeiro Flip-flop,
    ---aciona a led(0), e passa essa entrada para o segundo
    ---Flip-flop.
    led(0) <= q_out0;
    
    ff_assinc1 : ff_D_preset_clr_assinc port map(
        D => q_out0,
        clk => clk,
        Q => q_out1,
       
        
        clr => ff_assinc_clr
    ); 
    
    led(1) <= q_out1;
    
    ff_assinc2 : ff_D_preset_clr_assinc port map(
        D => q_out1,
        clk => clk,
        Q => q_out2,     
        clr => ff_assinc_clr
    );
    
    led(2) <= q_out2;
    
    ff_assinc3 : ff_D_preset_clr_assinc port map(
        D => q_out2,
        clk => clk,
        Q => q_out3,       
        clr => ff_assinc_clr
    );
    
    led(3) <= q_out3;
    
    ---O ff_assinc_Q é a última saída, no caso o bit que foi deslocado
    ff_assinc_Q <= q_out3;
    
    
        
    


end Behavioral;
