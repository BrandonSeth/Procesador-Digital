----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.02.2021 20:00:31
-- Design Name: 
-- Module Name: MCD_MCM - Behavioral
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

entity MCD_MCM is
   
   port(

    AF,BF     : in std_logic_vector(7 downto 0);
    R         : out std_logic_vector(7 downto 0);
    RESULTADO    : out std_logic_vector(7 downto 0);
    SEL0,CLR0,GO0,CLK0   : in std_logic
        );

end MCD_MCM;

architecture Behavioral of MCD_MCM is

component MUX_DE_X
port(

    A     : in std_logic_vector(7 downto 0);
    X2  : in std_logic_vector(7 downto 0);
    X3   : in std_logic_vector(7 downto 0);
    SEL   : in std_logic_vector (1 downto 0); 
    X : out std_logic_vector(7 downto 0)
    
    );

end component;

component MUX_DE_Y

port(

    B     : in std_logic_vector(7 downto 0);
    Y2   : in std_logic_vector(7 downto 0);
    Y3   : in std_logic_vector(7 downto 0);
    SEL   : in std_logic_vector (1 downto 0); 
    Y : out std_logic_vector(7 downto 0)
    
    );

end component;

component REG_SEL

port(
    AR   : in std_logic_vector(7 downto 0);
    BR   : in std_logic_vector(7 downto 0);
    SR   : in std_logic;
    ARO  : out std_logic_vector(7 downto 0);
    BRO  : out std_logic_vector(7 downto 0);
    SRO  : out std_logic;
    REGSEL,CLR,CLK   : in std_logic
    );
    
end component;

component REG_SALIDA

port(
    XOUT           : in std_logic_vector(7 downto 0);
    OUTG           : out std_logic_vector(7 downto 0);
    OUTLD,CLR,CLK   : in std_logic
    );

end component;

component REG_DE_X

port(
    INRX   : in std_logic_vector(7 downto 0);
    OUTRX  : out std_logic_vector(7 downto 0);
    XLD,CLR,CLK   : in std_logic
    );

end component;

component REG_DE_Y

port(
    INRY   : in std_logic_vector(7 downto 0);
    OUTRY  : out std_logic_vector(7 downto 0);
    YLD,CLR,CLK   : in std_logic
    );
    
end component;

component RES_DE_X

PORT( 
             YM : IN std_logic_vector(7 DOWNTO 0);
             XM : IN std_logic_vector(7 DOWNTO 0);  
             XOM : OUT std_logic_vector(7 DOWNTO 0));

end component;

component RES_DE_Y

PORT( 
             YM : IN std_logic_vector(7 DOWNTO 0);
             XM : IN std_logic_vector(7 DOWNTO 0);  
             YOM : OUT std_logic_vector(7 DOWNTO 0));
             
end component;

component SUM_DE_X

PORT( 
             XP : IN std_logic_vector(7 DOWNTO 0); 
             AP : IN std_logic_vector(7 DOWNTO 0);  
             XOP : OUT std_logic_vector(7 DOWNTO 0));

end component;

component SUM_DE_Y

PORT( 
             YP : IN std_logic_vector(7 DOWNTO 0); 
             BP : IN std_logic_vector(7 DOWNTO 0);  
             YOP : OUT std_logic_vector(7 DOWNTO 0));

end component;

component COMPA

PORT( 
             XC : IN std_logic_vector(7 DOWNTO 0); 
             YC : IN std_logic_vector(7 DOWNTO 0);  
             EQ : OUT std_logic;
             MAX : OUT std_logic
     );

end component;

component U_C

PORT( 
      CLR,CLK,SUC,GO,EQUC,MAXUC  : in std_logic;
      LDRABS, LDRO, LDRX, LDRY   : out std_logic;
      SELM1,SELM2 : out std_logic_vector (1 downto 0)
      );

end component;


signal XLCM, XGCD, YLCM, YGCD, XMUX, YMUX : std_logic_vector(7 downto 0);
signal AR0,BR0,RX,RY : std_logic_vector(7 downto 0);
signal SELMUX : std_logic_vector(1 downto 0);
signal LDR0,SR0,LDRX0,LDRY0,LDO,FMAX,FEQ : std_logic;

begin

MUXDEX : MUX_DE_X port map (A => AF, X2 => XGCD, X3 => XLCM, SEL => SELMUX,
                         X => XMUX ); 

MUXDEY : MUX_DE_Y port map (B => BF, Y2 => YGCD, Y3 => YLCM, SEL => SELMUX,
                         Y=> YMUX);
                         
SELECCCIONREGISTRO : REG_SEL port map ( AR => AF, BR => BF, SR => SEL0, 
                ARO => AR0 ,BRO => BR0 , SRO => SR0, REGSEL => LDR0,
                CLR => CLR0 ,CLK => CLK0);
                
REGITROX : REG_DE_X port map (INRX => XMUX, OUTRX => RX, XLD => LDRX0, CLR => CLR0 ,CLK => CLK0);

REGISTROY : REG_DE_Y port map (INRY => YMUX, OUTRY => RY, YLD => LDRY0, CLR => CLR0 ,CLK => CLK0);

REGOSALIDITA : REG_SALIDA port map (XOUT => RX, OUTG => R, OUTLD => LDO, CLR => CLR0 ,CLK => CLK0);

SX : SUM_DE_X port map  (XP => RX, AP => AR0, XOP => XLCM);
    
SY : SUM_DE_Y port map  (YP => RY, BP => BR0, YOP => YLCM);

RESTADEX : RES_DE_X port map (YM => RY, XM => RX, XOM => XGCD);

RESTADEY : RES_DE_Y port map (YM => RY, XM => RX, YOM => YGCD);

COMPARACION : COMPA port map (XC => RX, YC => RY, EQ => FEQ, MAX => FMAX);

UNIDADDECONTROL : U_C port map (CLR => CLR0 ,CLK => CLK0, SUC => SR0, GO => GO0,
                              EQUC => FEQ, MAXUC => FMAX,
                              LDRABS => LDR0 , LDRO => LDO , LDRX => LDRX0 , LDRY=> LDRY0,
                              SELM1 => SELMUX,SELM2 => SELMUX);
        RESULTADO <= XMUX;
end Behavioral;

