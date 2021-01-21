----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.01.2021 20:29:50
-- Design Name: 
-- Module Name: xmux - Behavioral
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

entity xmux is
    Port ( xsel : in STD_LOGIC;
           xin : in STD_LOGIC_VECTOR (7 downto 0);
           xr : in STD_LOGIC_VECTOR (7 downto 0);
           x1 : out STD_LOGIC_VECTOR (7 downto 0));
end xmux;

architecture Behavioral of xmux is

begin


end Behavioral;
