----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.02.2021 20:38:48
-- Design Name: 
-- Module Name: DE_SELECCIONPSI - Behavioral
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

entity REG_SEL is 

port(
    AR   : in std_logic_vector(7 downto 0);
    BR   : in std_logic_vector(7 downto 0);
    SR   : in std_logic;
    ARO  : out std_logic_vector(7 downto 0);
    BRO  : out std_logic_vector(7 downto 0);
    SRO  : out std_logic;
    REGSEL  : in std_logic;
    CLR : in std_logic;
    CLK   : in std_logic
    );
    
end REG_SEL;

architecture Behavioral of REG_SEL is

begin

REGISTRO : process (CLK,CLR)
 
     begin
     
        IF (CLR='1') THEN
        ARO <= "00000000";
        BRO <= "00000000";
        SRO <= '0';
        ELSIF (rising_edge(CLK)) THEN
        IF (REGSEL = '1') THEN 
        ARO <= AR;
        BRO <= BR;
        SRO <= SR;
    end if;
    end if;
    end process; 
    


end Behavioral;
 
