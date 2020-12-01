

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SISO_reg is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           data_in : in STD_LOGIC;
           data_out : out STD_LOGIC);
end SISO_reg;

architecture Behavioral of SISO_reg is
    signal reg: std_logic_vector(3 downto 0) := "0000";
begin

    process(clk, reset)
    begin
        if reset='1' then
            reg <= "0000";
        elsif rising_edge(clk) then
                reg <= data_in & reg(3 downto 1);
         end if;
    end process;
    
    --- O data_out recebe o valor do bit deslocado, 
    ---o bit menos significativo.
    data_out <= reg(0);


end Behavioral;
