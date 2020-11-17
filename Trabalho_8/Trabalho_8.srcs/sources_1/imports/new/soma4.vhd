library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity soma4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           CIN : in STD_LOGIC;
           SEL : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           COUT : out STD_LOGIC);
end soma4;

architecture Behavioral of soma4 is

    signal c0, c1, c2, aux_of, aux_s, aux_cin: STD_LOGIC;
    
    signal aux_B: STD_LOGIC_VECTOR (3 downto 0);
    
    signal aux_c2: STD_LOGIC_VECTOR (3 downto 0);
    
    component soma1
        Port ( a : in STD_LOGIC;
               b : in STD_LOGIC;
               cin : in STD_LOGIC;
               s : out STD_LOGIC;
               cout : out STD_LOGIC);
    end component;
    
    component overflow
        Port ( of_a : in STD_LOGIC;
               of_b : in STD_LOGIC;
               of_s : in STD_LOGIC;
               of_out : out STD_LOGIC);
    end component;
    
    component complemento_de_1
        Port ( cp_in : in STD_LOGIC_VECTOR (3 downto 0);
               cp_SEL : in STD_LOGIC;
               cp_out : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

begin

    cp1: complemento_de_1 port map (cp_in=>B, cp_SEL=>SEL, cp_out=>aux_B);
    
    aux_c2(0) <= '1';
    aux_c2(1) <= '0';
    aux_c2(2) <= '0';
    aux_c2(3) <= '0';

    sum1: soma1 port map (a=>A(0), b=>aux_B(0), cin=>SEL, s=>S(0), cout=>c0);
    sum2: soma1 port map (a=>A(1), b=>aux_B(1), cin=>c0, s=>S(1), cout=>c1);
    sum3: soma1 port map (a=>A(2), b=>aux_B(2), cin=>c1, s=>S(2), cout=>c2);
    sum4: soma1 port map (a=>A(3), b=>aux_B(3), cin=>c2, s=>aux_s, cout=>aux_of);
    S(3) <= aux_s;

    ovf: overflow port map (of_a=>A(3), of_b=>aux_B(3), of_s=>aux_s, of_out=>COUT);

end Behavioral;
