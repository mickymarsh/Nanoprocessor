----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2024 02:48:03 PM
-- Design Name: 
-- Module Name: Comparator - Behavioral
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

entity Comparator is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           Greater : out STD_LOGIC;
           Equal : out STD_LOGIC;
           Less : out STD_LOGIC);
end Comparator;

architecture Behavioral of Comparator is

SIGNAL x0,x1,x2,x3  : std_logic; 
SIGNAL A0BAR, A1BAR, A2BAR, A3BAR  : std_logic; 
SIGNAL B0BAR, B1BAR, B2BAR, B3BAR  : std_logic;
SIGNAL GreaterWhenPositive, LessWhenPositive  : std_logic;

begin

x0 <= NOT(A(0) XOR B(0));
x1 <= NOT(A(1) XOR B(1));
x2 <= NOT(A(2) XOR B(2));
x3 <= NOT(A(3) XOR B(3));

A0BAR <= NOT(A(0));
A1BAR <= NOT(A(1));
A2BAR <= NOT(A(2));
A3BAR <= NOT(A(3));
B0BAR <= NOT(B(0));
B1BAR <= NOT(B(1));
B2BAR <= NOT(B(2));
B3BAR <= NOT(B(3));

GreaterWhenPositive <= ( A(3) AND B3BAR) OR ( X3 AND A(2) AND B2BAR) OR ( X3 AND X2 AND A(1) AND B1BAR) OR ( X3 AND X2 AND X1 AND A(0) AND B0BAR);
LessWhenPositive <= ( B(3) AND A3BAR) OR ( X3 AND B(2) AND A2BAR) OR ( X3 AND X2 AND B(1) AND A1BAR) OR ( X3 AND X2 AND X1 AND B(0) AND A0BAR);

Equal <= EN AND (   x3 AND x2 AND x1 AND x0   );
Greater <= EN AND (   (A3BAR AND B3BAR AND GreaterWhenPositive) OR (A3BAR AND B(3))  OR (A(3) AND B(3) AND NOT(LessWhenPositive)) );
less <= EN AND (   (A3BAR AND B3BAR AND LessWhenPositive)  OR (A(3) AND B3BAR) OR (A(3) AND B(3) AND NOT(GreaterWhenPositive)) );

end Behavioral;
