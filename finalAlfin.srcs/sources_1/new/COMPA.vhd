----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.02.2021 22:50:13
-- Design Name: 
-- Module Name: COMPA - Behavioral
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


entity COMPA is

PORT( 
             XC : IN std_logic_vector(7 DOWNTO 0); 
             YC : IN std_logic_vector(7 DOWNTO 0);  
             EQ : OUT std_logic;
             MAX : OUT std_logic
     );

end COMPA;
            
architecture Behavioral of COMPA is

begin

process (XC,YC)
  
  begin 
  
     IF YC = XC THEN EQ <= '1';
      MAX <= '0'; 
      END IF;
     IF YC > XC THEN EQ <= '0';
      MAX <= '0'; 
      END IF;
     IF YC < XC THEN EQ <= '0'; 
     MAX <= '1'; 
     END IF;
end process; 

end Behavioral;