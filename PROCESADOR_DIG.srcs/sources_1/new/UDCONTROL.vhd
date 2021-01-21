----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.01.2021 20:29:50
-- Design Name: 
-- Module Name: UDCONTROL - Behavioral
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

entity UDCONTROL is
    Port ( clk : in STD_LOGIC;
           clr : in STD_LOGIC;
           xsel : out STD_LOGIC;
           ysel : out STD_LOGIC;
           go : in STD_LOGIC;
           eqflg : in STD_LOGIC;
           ltflg : in STD_LOGIC;
           gld : out STD_LOGIC);
end UDCONTROL;

architecture Behavioral of UDCONTROL is

begin


end Behavioral;
