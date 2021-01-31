----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.01.2021 21:21:07
-- Design Name: 
-- Module Name: Control_GCD - Behavioral
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

entity Control_GCD is
    Port ( clk : in STD_LOGIC;
           clr : in STD_LOGIC;
           go : in STD_LOGIC;
           eqflg : in STD_LOGIC;
           ltflg : in STD_LOGIC;
           xmsel : out STD_LOGIC;
           ymsel : out STD_LOGIC;
           xld : out STD_LOGIC;
           yld : out STD_LOGIC;
           gld : out STD_LOGIC);
end Control_GCD;

architecture Behavioral of Control_GCD is
type state_type is (start, input, test1, test2, update1,update2, done);
signal present_state, next_state: state_type;

begin
sreg:process(clk,clr)
begin
if clr = '1' then
present_state <= start;
elsif clk'event and clk='1' then 
present_state <= next_state;
end if;
end process;
C1: process(present_state, go, eqflg, ltflg)
begin
case present_state is 
when start =>
if go ='1' then 
next_state <= input;
else
next_state <= start;
end if;
when input =>
next_state <= test1;
when test1 =>
if eqflg = '1' then
next_state <= done;
else
next_state <= test2;
end if;
when test2=>
if ltflg = '1' then
next_state <= update1;
else
next_state <= update2;
end if;
when update1 =>
next_state <= test1;
when update2 =>
next_state <= test1;
when done =>
next_state <= done;
when others=> null;
end case;
end process;
C2: process(present_state)
begin
xld <= '0';
yld <= '0';
gld <= '0';
xmsel <= '0';
ymsel <= '0';
case present_state is 
when input=>
xld <= '1';
yld <= '1';
gld <= '1';
xmsel <= '1';
ymsel <= '1';
when update1 =>
yld <= '1';
when update2 =>
xld <= '1';
when done =>
gld <= '1';
when others =>
null;
end case;
end process;

end Behavioral;
