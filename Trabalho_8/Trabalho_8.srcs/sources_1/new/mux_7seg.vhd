library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux_7seg is
    Port ( bcd_unidade : in STD_LOGIC_VECTOR (3 downto 0);
           bcd_dezena : in STD_LOGIC_VECTOR (3 downto 0);
           bcd_centena : in STD_LOGIC_VECTOR (3 downto 0);
           bcd_milhares : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           an : out STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           dp : out STD_LOGIC);
end mux_7seg;

architecture Behavioral of mux_7seg is

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
               when 1 => s_an  <= "1110"; bcd_now <= bcd_unidade;
               when 2 => s_an  <= "1101"; bcd_now <= bcd_dezena;
               when 3 => s_an  <= "1011"; bcd_now <= bcd_centena;
               when 4 => s_an  <= "0111"; bcd_now <= bcd_milhares;
               when others => null;
            end case;
            seletor_display <= seletor_display + 1 ;
        end if; 
    end process;
    
    an <= s_an;
    dp <= '1';
         
--       dr_bcd :  bcd_7_seg port map(sw =>bcd_now, seg <= seg);
    

end Behavioral;
