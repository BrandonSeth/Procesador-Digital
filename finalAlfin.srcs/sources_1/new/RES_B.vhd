----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.02.2021 22:34:56
-- Design Name: 
-- Module Name: RES_B - Behavioral
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

entity RES_DE_Y is

PORT( 
             YM : IN std_logic_vector(7 DOWNTO 0);
             XM : IN std_logic_vector(7 DOWNTO 0);  
             YOM : OUT std_logic_vector(7 DOWNTO 0));

end RES_DE_Y;

architecture Behavioral of RES_DE_Y is
   
begin
        YOM <= (YM - XM);

end Behavioral;
