----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.11.2020 03:52:36
-- Design Name: 
-- Module Name: ff_D - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ff_D is
    Port ( D : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Q_not : out STD_LOGIC);
end ff_D;

architecture Behavioral of ff_D is
   signal qt : STD_LOGIC ;
begin
    
    Q <= qt;
    Q_not <= not qt;
    
    ffD : process(clk)
    begin
        --Quando o clock sobe, ele joga a o signal de D(entrada) para qt,
        --atualizando assim as saídas Q, e Q_not.
        if rising_edge(clk) then
            qt <= D;
        end if;
    end process;

end Behavioral;
