----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.02.2021 20:45:11
-- Design Name: 
-- Module Name: REGDESEL - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity REGDESEL is
port(
    REG1  : in std_logic_vector(7 downto 0);
    REG2   : in std_logic_vector(7 downto 0);
    REGSEL   : in std_logic;
    REGA0  : out std_logic_vector(7 downto 0);
    REGB0 : out std_logic_vector(7 downto 0);
    REGS0  : out std_logic;
    REGDESEL:in std_logic;
    clr: in std_logic;
    clk   : in std_logic
    );
    
end REGDESEL;

architecture Behavioral of REGDESEL is

begin
REGISTRO : process (clk,clr)
 
     begin
     
        IF (clr='1') THEN
         REGA0<= "00000000";
         REGB0<= "00000000";
        REGS0 <= '0';
        ELSIF (rising_edge(clr)) THEN
        IF (REGDESEL = '1') THEN 
    REGA0 <= REG1;REGB0 <= REG2;REGS0<= REGSEL;
    end if;
    end if;
    end process; 

end Behavioral;
