----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.02.2021 21:44:20
-- Design Name: 
-- Module Name: REGB01 - Behavioral
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

entity REG_DE_Y is 

port(
    INRY   : in std_logic_vector(7 downto 0);
    OUTRY  : out std_logic_vector(7 downto 0);
    YLD,CLR,CLK   : in std_logic
    );
    
end REG_DE_Y;

architecture Behavioral of REG_DE_Y is

begin

REGISTRO : process (CLK,CLR)
 
     begin
     
        IF (CLR='1') THEN
        OUTRY <= "00000000";
        ELSIF (rising_edge(CLK)) THEN
        IF (YLD = '1') THEN 
        OUTRY <= INRY;
    end if;
    end if;
    end process; 
    


end Behavioral;
 
