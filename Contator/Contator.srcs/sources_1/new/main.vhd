library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port ( En : in STD_LOGIC;
           Rst : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (0 to 3));
end main;

architecture Behavioral of main is

    component  ff_D_clr is
        Port ( D : in STD_LOGIC;
               clk : in STD_LOGIC;
               Q : out STD_LOGIC;
               Q_not : out STD_LOGIC;
               clr : in STD_LOGIC);
    end component;


    signal clk_dividido: std_logic := '0' ;
    signal counter : integer range 1 to 100_000_000 := 1;
    
    
    signal q_not0 : std_logic := '0';
    signal q_not1 : std_logic := '0';
    signal q_not2 : std_logic := '0';
    signal q_not3 : std_logic := '0';
    
    
    
    signal q_out0 : std_logic := '0';
    signal q_out1 : std_logic := '0';
    signal q_out2 : std_logic := '0';
    signal q_out3 : std_logic := '0';
    
 

begin

    
    divisor_clk : process(En)
     begin
        if rising_edge(En) then
            if counter = 100_000_000 then
                counter <= 1;
                clk_dividido <= not clk_dividido;
            else 
                counter <= counter + 1;
            end if ;   
        end if;
     end process;
     
     
     led(0) <= q_not3;
     led(1) <= q_not2;
     led(2) <= q_not1;
     led(3) <= q_not0;
     
     
     ff0: ff_D_clr port map(
     clr => Rst,
     clk => En,
     D => q_not0,
     Q => q_out0,
     Q_not => q_not0
     );
     
     
     
     ff1: ff_D_clr port map(
     clr => Rst,
     clk => q_not0,
     D => q_not1,
     Q => q_out1,
     Q_not => q_not1
     );
     
     
     
     ff2: ff_D_clr port map(
     clr => Rst,
     clk => q_not1,
     D => q_not2,
     Q => q_out2,
     Q_not => q_not2
     );
     
   
     
     ff3: ff_D_clr port map(
     clr => Rst,
     clk => q_not2,
     D => q_not3,
     Q => q_out3,
     Q_not => q_not3
     );
     
    
     
     
     
    

end Behavioral;