library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port ( JB : in STD_LOGIC_VECTOR (1 downto 0);
           led : out STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           clk : in STD_LOGIC
           );
end main;

architecture Behavioral of main is

    component  ff_D_clr is
        Port ( D : in STD_LOGIC;
               clk : in STD_LOGIC;
               Q : out STD_LOGIC;
               Q_not : out STD_LOGIC;
               clr : in STD_LOGIC);
    end component;
    
    component BCD_to_7seg
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               LEDS : out STD_LOGIC_VECTOR (6 downto 0));
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
    
    
    signal  en0 : std_logic := '0';
    signal  en1 : std_logic := '0';
    signal  en2 : std_logic := '0';
    signal  en3 : std_logic := '0';
    
    
    signal En : std_logic;
    signal Rst : std_logic;
    
    signal FF_number : std_logic_vector (0 to 3);

begin

    En <= JB(0);
    Rst <= JB(1);
    
 
        
    divisor_clk : process(clk)
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
     
        
    
     
     
     ff0: ff_D_clr port map(
     clr => Rst,
     clk => clk_dividido,
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
     
     
     
     vvv : process(clk, En)
     begin
         if En='0' then
             en0 <= q_not3;
             en1 <= q_not2;
             en2 <= q_not1;
             en3 <= q_not0;
             FF_number(0) <= q_not3;
             FF_number(1) <= q_not2;
             FF_number(2) <= q_not1;
             FF_number(3) <= q_not0;
         else
             q_not3 <= en0;
             q_not2 <= en1;
             q_not1 <= en2;
             q_not0 <= en3;
             FF_number(0) <= en0;
             FF_number(1) <= en1;
             FF_number(2) <= en2;
             FF_number(3) <= en3;
        end if;
      end process;
    
     seven_seg: BCD_to_7seg port map (A=>FF_number, LEDS=>seg );
     
     
    

end Behavioral;
