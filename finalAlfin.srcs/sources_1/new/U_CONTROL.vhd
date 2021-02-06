----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.02.2021 22:56:48
-- Design Name: 
-- Module Name: U_CONTROL - Behavioral
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

entity U_C is

PORT( 
      CLR,CLK,SUC,GO,EQUC,MAXUC  : in std_logic;
      LDRABS, LDRO, LDRX, LDRY   : out std_logic;
      SELM1,SELM2 : out std_logic_vector (1 downto 0)
      );
      
end U_C;

architecture Behavioral of U_C is

type state_type is (START,INPUT,TEST1,TEST2,TEST3,TEST4,SUMAX,SUMAY,RESTAX,RESTAY,DONE);
signal PRESENT_S,NEXT_S : STATE_TYPE;


begin

STATE_REGISTER : PROCESS (CLK,CLR)
begin 
      if(CLR = '1') then
      PRESENT_S <= START;
      elsif (rising_edge(CLK)) then
      PRESENT_S <= NEXT_S;
      end if; 
end process STATE_REGISTER;

C1 : process (PRESENT_S,SUC,GO,EQUC,MAXUC)

begin 
   LDRABS <= '0'; LDRO <='0'; LDRX <='0'; LDRY<='0';
   
   case PRESENT_S is
   
    when START =>
   
    if (GO = '1') then NEXT_S <= INPUT;  
    else   
    NEXT_S <= START; 
    end if;   
   
    when INPUT =>
    NEXT_S <=TEST1;
    LDRABS <= '1';  LDRX <='1'; LDRY<='1'; SELM1<="01";SELM2<="01"; LDRO <='0'; 
 
    
    
    when TEST1 =>
    if (EQUC='1') then NEXT_S <= DONE; 
    else NEXT_S <= TEST2; 
    end if;
    
    when TEST2 => 
    if (SUC='1') then NEXT_S <= TEST3; 
    else  NEXT_S <= TEST4; 
    end if;
    
    when TEST3 =>
    if (MAXUC='1') then NEXT_S <= RESTAX; LDRX<='0'; 
    else NEXT_S <= RESTAY; LDRY<='0';
    end if;
    
    when TEST4 =>
    if (MAXUC='1') then NEXT_S <= SUMAY; LDRY<='0'; 
    else NEXT_S <= SUMAX; LDRX<='0';
    end if;
   
 
  
    when RESTAY => LDRY<='1'; NEXT_S <= TEST1; SELM1<="10";SELM2<="10";
    when RESTAX => LDRX<='1'; NEXT_S <= TEST1; SELM1<="10";SELM2<="10";
    when SUMAX =>  LDRX<='1'; NEXT_S <= TEST1; SELM1<="11";SELM2<="11";
    when SUMAY =>  LDRY<='1'; NEXT_S <= TEST1; SELM1<="11";SELM2<="11";
    
    when DONE =>
    NEXT_S <=DONE; LDRO <='1';
      
end case;      
end process C1;



end Behavioral;