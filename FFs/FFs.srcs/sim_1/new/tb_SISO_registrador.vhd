

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_SISO_registrador is
--  Port ( );
end tb_SISO_registrador;

architecture Behavioral of tb_SISO_registrador is

    component main is
        Port (
           clk: in STD_LOGIC;
           ff_assinc_D : in STD_LOGIC;
           ff_assinc_clr : in STD_LOGIC;
           ff_assinc_Q: out STD_LOGIC;
           led : out std_logic_vector (3 downto 0) 
             );
         end component;

    signal sclk, sff_assinc_D , sff_assinc_clr, sff_assinc_Q : std_logic := '0';
    signal sled : std_logic_vector (3 downto 0) := "0000";
    
begin
    
    uut : main port map (
       clk => sclk,
       ff_assinc_D => sff_assinc_D,
       ff_assinc_clr => sff_assinc_clr,
       ff_assinc_Q => sff_assinc_Q,  
       led => sled);

    sff_assinc_clr <= '0', '1' after 15 ns, '0' after 35 ns;
    sclk <= not sclk after 5ns; --Tclk = 10 ns , flck(freq. de clock) = 100MHZ;
    sff_assinc_D <= '0' , '1' after 5ns , '0' after 65ns , '1' after 75ns, '0' after 85 ns;
    
end Behavioral;
