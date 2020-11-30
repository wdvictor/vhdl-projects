

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity main is
    Port (
       clk: in STD_LOGIC;
       latch_D, ffD_D, ff_sinc_D, ff_assinc_D : in STD_LOGIC;
       ff_sinc_clr, ff_assinc_clr : in STD_LOGIC;
       latch_E: in STD_LOGIC;
       latch_Q , ff_Q , ff_sinc_Q, ff_assinc_Q: out STD_LOGIC;
       latch_Qnot, ff_Qnot, ff_sinc_Qnot, ff_assinc_Qnot : out STD_LOGIC
    );

end main;

architecture Behavioral of main is
    
    component  latchD
    Port ( D : in STD_LOGIC;
           E : in STD_LOGIC;
           Q : out STD_LOGIC;
           Q_not : out STD_LOGIC);
end component;

    component ff_D_preset_clr_assinc
        Port ( D : in STD_LOGIC;
               clk : in STD_LOGIC;
               Q : out STD_LOGIC;
               Q_not : out STD_LOGIC;
               preset : in STD_LOGIC;
               clr : in STD_LOGIC);
    end component;
    
    component ff_D
    Port ( D : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Q_not : out STD_LOGIC);
    end component;


    component ff_D_preset_clr_sinc
        Port ( D : in STD_LOGIC;
               clk : in STD_LOGIC;
               Q : out STD_LOGIC;
               Q_not : out STD_LOGIC;
               preset : in STD_LOGIC;
               clr : in STD_LOGIC);
    end component;
    


begin


end Behavioral;
