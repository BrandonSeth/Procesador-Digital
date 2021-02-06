----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.02.2021 20:34:28
-- Design Name: 
-- Module Name: MUX_B - Behavioral
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

entity MUX_DE_Y is

port(

    B     : in std_logic_vector(7 downto 0);
    Y2   : in std_logic_vector(7 downto 0);
    Y3   : in std_logic_vector(7 downto 0);
    SEL   : in std_logic_vector (1 downto 0); 
    Y : out std_logic_vector(7 downto 0)
    
    );
    
end MUX_DE_Y;

architecture Behavioral of MUX_DE_Y is

begin

       PROCESS (B,Y2,Y3,SEL) IS
       BEGIN
         CASE SEL IS
           WHEN "00" => Y <= (others => '0');
           WHEN "01" => Y <=  B;
           WHEN "10" => Y <= Y2;
           WHEN "11" => Y <= Y3;
           WHEN OTHERS => Y <= (others => '0');
         END CASE;
       END PROCESS;

end Behavioral;


      