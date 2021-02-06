----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.02.2021 22:08:52
-- Design Name: 
-- Module Name: SUM_A - Behavioral
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

entity SUM_DE_X is

PORT( 
             XP : IN std_logic_vector(7 DOWNTO 0); 
             AP : IN std_logic_vector(7 DOWNTO 0);  
             XOP : OUT std_logic_vector(7 DOWNTO 0));

end SUM_DE_X;

architecture Behavioral of SUM_DE_X is
   
begin
        XOP <= (AP + XP);

end Behavioral;
