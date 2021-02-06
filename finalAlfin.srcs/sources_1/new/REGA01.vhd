----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.02.2021 21:19:49
-- Design Name: 
-- Module Name: REGA01 - Behavioral
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

entity REG_DE_X is 

port(
    INRX   : in std_logic_vector(7 downto 0);
    OUTRX  : out std_logic_vector(7 downto 0);
    XLD,CLR,CLK   : in std_logic
    );
    
end REG_DE_X;

architecture Behavioral of REG_DE_X is

begin

REGISTRO : process (CLK,CLR)
 
     begin
     
        IF (CLR='1') THEN
        OUTRX <= "00000000";
        ELSIF (rising_edge(CLK)) THEN
        IF (XLD = '1') THEN 
        OUTRX <= INRX;
    end if;
    end if;
    end process; 
    


end Behavioral;