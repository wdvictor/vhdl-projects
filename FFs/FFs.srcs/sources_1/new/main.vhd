

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity main is
    Port (
       clk: in STD_LOGIC;
       ff_assinc_D : in STD_LOGIC;
       ff_assinc_clr : in STD_LOGIC;
       ff_assinc_Q: out STD_LOGIC;
       led : out std_logic_vector (15 downto 0) 
         );

end main;

architecture Behavioral of main is
    
 
    component ff_D_preset_clr_assinc
        Port ( D : in STD_LOGIC;
               clk : in STD_LOGIC;
               Q : out STD_LOGIC;
               clr : in STD_LOGIC);
    end component;

    signal q_out0 : std_logic := '0';
    signal q_out1 : std_logic := '0';
    signal q_out2 : std_logic := '0';
    signal q_out3 : std_logic := '0';
    signal q_out4 : std_logic := '0';
    signal q_out5 : std_logic := '0';
    signal q_out6 : std_logic := '0';
    signal q_out7 : std_logic := '0';
    signal q_out8 : std_logic := '0';
    signal q_out9 : std_logic := '0';
    signal q_out10 : std_logic := '0';
    signal q_out11 : std_logic := '0';
    signal q_out12 : std_logic := '0';
    signal q_out13 : std_logic := '0';
    signal q_out14 : std_logic := '0';
    signal q_out15 : std_logic := '0';
    

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
    
     ff_assinc4 : ff_D_preset_clr_assinc port map(
        D => q_out3,
        clk => clk,
        Q => q_out4,       
        clr => ff_assinc_clr
    );
    
    led(4) <= q_out4;
    
    ff_assinc5 : ff_D_preset_clr_assinc port map(
        D => q_out4,
        clk => clk,
        Q => q_out5,       
        clr => ff_assinc_clr
    );
    
    led(5) <= q_out5;
    
    ff_assinc6 : ff_D_preset_clr_assinc port map(
        D => q_out5,
        clk => clk,
        Q => q_out6,       
        clr => ff_assinc_clr
    );
    
    led(6) <= q_out6;
    
    ff_assinc7 : ff_D_preset_clr_assinc port map(
        D => q_out6,
        clk => clk,
        Q => q_out7,       
        clr => ff_assinc_clr
    );
    
    led(7) <= q_out7;
    
    
    ff_assinc8 : ff_D_preset_clr_assinc port map(
        D => q_out7,
        clk => clk,
        Q => q_out8,       
        clr => ff_assinc_clr
    );
    
    led(8) <= q_out8;
    
    
    ff_assinc9 : ff_D_preset_clr_assinc port map(
        D => q_out8,
        clk => clk,
        Q => q_out9,       
        clr => ff_assinc_clr
    );
    
    led(9) <= q_out9;
    
    
    ff_assinc10 : ff_D_preset_clr_assinc port map(
        D => q_out9,
        clk => clk,
        Q => q_out10,       
        clr => ff_assinc_clr
    );
    
    led(10) <= q_out10;
    
    
    ff_assinc11 : ff_D_preset_clr_assinc port map(
        D => q_out10,
        clk => clk,
        Q => q_out11,       
        clr => ff_assinc_clr
    );
    
    led(11) <= q_out11;
    
    
    ff_assinc12 : ff_D_preset_clr_assinc port map(
        D => q_out11,
        clk => clk,
        Q => q_out12,       
        clr => ff_assinc_clr
    );
    
    led(12) <= q_out12;
    
    
    ff_assinc13 : ff_D_preset_clr_assinc port map(
        D => q_out12,
        clk => clk,
        Q => q_out13,       
        clr => ff_assinc_clr
    );
    
    led(13) <= q_out13;
    
    
    ff_assinc14 : ff_D_preset_clr_assinc port map(
        D => q_out13,
        clk => clk,
        Q => q_out14,       
        clr => ff_assinc_clr
    );
    
    led(14) <= q_out14;
    
    
    
    ff_assinc15 : ff_D_preset_clr_assinc port map(
        D => q_out14,
        clk => clk,
        Q => q_out15,       
        clr => ff_assinc_clr
    );
    
    led(15) <= q_out15;

    ff_assinc_Q <= q_out15;
    
    
        
    


end Behavioral;
