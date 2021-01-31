----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.01.2021 19:20:24
-- Design Name: 
-- Module Name: datapathGCD - Behavioral
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
use IEEE.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity datapathGCD is
    Port ( clk : in STD_LOGIC;
           clr : in STD_LOGIC;
           xmsel : in STD_LOGIC;
           ymsel : in STD_LOGIC;
           xld : in STD_LOGIC;
           yld : in STD_LOGIC;
           gld : in STD_LOGIC;
           xin : in STD_LOGIC_VECTOR (7 downto 0);
           yin : in STD_LOGIC_VECTOR (7 downto 0);
           gcd : out STD_LOGIC_VECTOR (7 downto 0);
           eqflg : out STD_LOGIC;
           ltflg : out STD_LOGIC);
end datapathGCD;

architecture Behavioral of datapathGCD is
component mux2
generic(
        N : INTEGER);
PORT(

        a: in std_logic_vector(N-1 downto 0);
        b: in std_logic_vector(N-1 downto 0);
        s: in std_logic;
        y: out std_logic_vector(N-1 downto 0));
        
end component;

component reg
generic(
        N: INTEGER);
PORT(
        carga : in std_logic;
        d     : in std_logic_vector(N-1 downto 0);
        clk   : in std_logic;
        clr   : in std_logic;
        q     : out std_logic_vector(N-1 downto 0));
end component;
signal x, y, x1, y1, xmy, ymx: std_logic_vector(7 downto 0);
begin

    xmy <= x - y;
    ymx <= y - x;
EQ: process(x,y)
begin
if x = y then
eqflg <= '1';
else
eqflg <= '0';
end if;
end process EQ;
LT: process(x,y)
begin

    if x < y then
        ltflg <= '1';
    else
        ltflg <= '0';
    end if;
    end process LT;
    
M1: mux2
    generic map(
                N => 8)
PORT MAP(
          a=> xmy,b=> xin,
          s=> ymsel, y=>x1);
M2: mux2
    generic map(
                N=>8)
PORT MAP(
        a=> ymx, b=> yin,
        s=> ymsel, y=> y1);
R1 : reg
    generic map(
                N=>8)
Port map(
         carga=>xld, 
         d=>x1, 
         clk => clk,
         clr => clr,
         q => x);
R2 : reg
    generic map(
                N=>8)
Port map(
         carga=>yld, 
         d => y1, 
         clk => clk,
         clr => clr,
         q => y);
R3 : reg
    generic map(
                N=>8)
Port map(
         carga=>gld, 
         d=>x, 
         clk => clk,
         clr => clr,
         q => gcd);

end Behavioral;
