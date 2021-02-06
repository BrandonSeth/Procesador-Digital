----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.02.2021 21:56:43
-- Design Name: 
-- Module Name: REGSAL0 - Behavioral
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

entity REG_SALIDA is 

port(
    XOUT           : in std_logic_vector(7 downto 0);
    OUTG           : out std_logic_vector(7 downto 0);
    OUTLD,CLR,CLK   : in std_logic
    );
    
end REG_SALIDA;

architecture Behavioral of REG_SALIDA is

begin

REGISTRO : process (CLK,CLR)
 
     begin
     
        IF (CLR='1') THEN
        OUTG <= "00000000";
        ELSIF (rising_edge(CLK)) THEN
        IF (OUTLD = '1') THEN 
        OUTG <= XOUT;
    end if;
    end if;
    end process; 
    


end Behavioral;
 

