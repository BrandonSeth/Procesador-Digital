----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.02.2021 20:11:51
-- Design Name: 
-- Module Name: MUX_A - Behavioral
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

entity MUX_DE_X is

port(

    A     : in std_logic_vector(7 downto 0);
    X2   : in std_logic_vector(7 downto 0);
    X3   : in std_logic_vector(7 downto 0);
    SEL   : in std_logic_vector (1 downto 0); 
    X : out std_logic_vector(7 downto 0)
    
    );
    
end MUX_DE_X;

architecture Behavioral of MUX_DE_X is

begin

       PROCESS (A,X2,X3,SEL) IS
       BEGIN
         CASE SEL IS
           WHEN "00" => X <= (others => '0');
           WHEN "01" => X <=  A;
           WHEN "10" => X <=  X2;
           WHEN "11" => X <= X3;
           WHEN OTHERS => X <= (others => '0');
         END CASE;
       END PROCESS;

end Behavioral;


