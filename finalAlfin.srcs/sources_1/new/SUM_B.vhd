----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.02.2021 22:17:20
-- Design Name: 
-- Module Name: SUM_B - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SUM_DE_Y is

PORT( 
             YP : IN std_logic_vector(7 DOWNTO 0); 
             BP : IN std_logic_vector(7 DOWNTO 0);  
             YOP : OUT std_logic_vector(7 DOWNTO 0));

end SUM_DE_Y;

architecture Behavioral of SUM_DE_Y is
   
begin
        YOP <= (BP + YP);

end Behavioral;

