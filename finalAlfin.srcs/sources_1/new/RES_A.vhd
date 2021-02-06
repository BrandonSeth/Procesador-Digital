----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.02.2021 22:29:00
-- Design Name: 
-- Module Name: RES_A - Behavioral
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

entity RES_DE_X is

PORT( 
             YM : IN std_logic_vector(7 DOWNTO 0);
             XM : IN std_logic_vector(7 DOWNTO 0);  
             XOM : OUT std_logic_vector(7 DOWNTO 0));

end RES_DE_X;

architecture Behavioral of RES_DE_X is
   
begin
        XOM <= (XM - YM);

end Behavioral;
