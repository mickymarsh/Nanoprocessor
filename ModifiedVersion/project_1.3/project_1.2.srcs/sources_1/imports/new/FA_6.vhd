----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/28/2024 04:48:13 PM
-- Design Name: 
-- Module Name: FA_6 - Behavioral
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

entity FA_6 is
    Port ( A : in STD_LOGIC_VECTOR (5 downto 0);
           B : in STD_LOGIC_VECTOR (5 downto 0);
           Y : OUT STD_LOGIC_VECTOR (6 downto 0));
end FA_6;

architecture Behavioral of FA_6 is
component FA
 port (
 A: in std_logic;
 B: in std_logic;
 C_IN: in std_logic;
 S: out std_logic;
 C_OUT: out std_logic);
 end component;
 
SIGNAL S0,C0,S1,C1,S2,C2,S3,C3,S4,C4,S5,C5 :STD_LOGIC;
begin

FA_0: FA port map(
A =>A(0),
B => B(0),
C_IN => '0',
S => S0,
C_OUT => C0
);
FA_1: FA port map(
A =>A(1),
B => B(1),
C_IN => C0,
S => S1,
C_OUT => C1
);
FA_2: FA port map(
A =>A(2),
B => B(2),
C_IN => C1,
S => S2,
C_OUT => C2
);
FA_3: FA port map(
A =>A(3),
B => B(3),
C_IN => C2,
S => S3,
C_OUT => C3
);
FA_4: FA port map(
A =>A(4),
B => B(4),
C_IN => C3,
S => S4,
C_OUT => C4
);
FA_5: FA port map(
A =>A(5),
B => B(5),
C_IN => C4,
S => S5,
C_OUT => C5
);

Y(0) <= S0;
Y(1) <= S1;
Y(2) <= S2;
Y(3) <= S3;
Y(4) <= S4;
Y(5) <= S5;
Y(6) <= C5;



end Behavioral;
