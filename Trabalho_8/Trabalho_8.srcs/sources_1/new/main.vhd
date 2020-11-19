library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port ( JB : in STD_LOGIC_VECTOR (4 downto 0);
           JC : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in std_logic;
           an : out STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           dp : out STD_LOGIC;
           led : out STD_LOGIC_VECTOR (0 downto 0));
end main;

architecture Behavioral of main is

    signal JBnum: STD_LOGIC_VECTOR (3 downto 0);
    signal JBsel: STD_LOGIC;
    
    signal ans: STD_LOGIC_VECTOR (3 downto 0);
    
    signal muxChoice: STD_LOGIC_VECTOR (3 downto 0);
    signal display: STD_LOGIC_VECTOR (3 downto 0);
    signal display_plus1: STD_LOGIC_VECTOR (3 downto 0);
    signal displayFinal: STD_LOGIC_VECTOR (3 downto 0);
    
    signal dump: STD_LOGIC;

    signal test: STD_LOGIC_VECTOR (1 downto 0);
    
  
    component soma4
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               CIN : in STD_LOGIC;
               SEL : in STD_LOGIC;
               S : out STD_LOGIC_VECTOR (3 downto 0);
               COUT : out STD_LOGIC);
    end component;
    
    component mux4
       Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC);
    end component;
    
    component BCD_to_7seg
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               LEDS : out STD_LOGIC_VECTOR (6 downto 0);
               point_in : in STD_LOGIC;
               point_out : out STD_LOGIC);
    end component;
    
    component complemento_de_1
        Port ( cp_in : in STD_LOGIC_VECTOR (3 downto 0);
               cp_SEL : in STD_LOGIC;
               cp_out : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal clk_dividido: std_logic := '0' ;
    signal counter : integer range 1 to 100_000 := 1;
    signal seletor_display : integer range 1 to 4 := 1;
    signal s_an, bcd_now : std_logic_vector (3 downto 0);



begin

    divisor_clk : process(clk)
     begin
        if rising_edge(clk) then
            if counter = 100_000 then
                counter <= 1;
                clk_dividido <= not clk_dividido;
            else 
                counter <= counter + 1;
            end if ;   
        end if;
     end process;

    
    multiplexacao : process (clk_dividido)
    begin 
        if rising_edge(clk_dividido) then
            case seletor_display is 
               when 1 => s_an  <= "1110"; 
               when 2 => s_an  <= "1101"; 
               when 3 => s_an  <= "1011";
               when 4 => s_an  <= "0111";
               when others => null;
            end case;
            seletor_display <= seletor_display + 1 ;
        end if; 
    end process;
    
    an <= s_an;

    JBsel <= JB(4);
    JBnum(0)<=JB(0);
    JBnum(1)<=JB(1);
    JBnum(2)<=JB(2);
    JBnum(3)<=JB(3);

    soma: soma4 port map (A=>JBnum, B=>JC, CIN=>'0', SEL=>JBsel, S=>ans, COUT=>led(0));
        
    mux: mux4 port map (A=>JBnum, B=>JC, C=>ans, S=>muxChoice, sel=> clk_dividido);
    
    cp: complemento_de_1 port map (cp_in=>muxChoice, cp_SEL=>muxChoice(3), cp_out=>display);
    
    plus1: soma4 port map (A=>display, B=>"0001", CIN=>'0', SEL=>'0', S=>display_plus1, COUT=>dump);
    
    WITH muxChoice(3) select
        displayFinal <= display WHEN '0',
                        display_plus1 WHEN OTHERS;
    
    seven_seg: BCD_to_7seg port map (A=>displayFinal, LEDS=>seg, point_in=>muxChoice(3), point_out=>dp);

end Behavioral;
