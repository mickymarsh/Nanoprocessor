----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2024 06:07:15 PM
-- Design Name: 
-- Module Name: XOR_operator - Behavioral
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

entity XOR_operator is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end XOR_operator;

architecture Behavioral of XOR_operator is
-- A XOR B = ( A.B') + (A'.B)

signal A_BAR_0,A_BAR_1,A_BAR_2,A_BAR_3 : STD_LOGIC;
signal B_BAR_0,B_BAR_1,B_BAR_2,B_BAR_3 : STD_LOGIC;

begin

A_BAR_0 <= NOT(A(0));
A_BAR_1 <= NOT(A(1));
A_BAR_2 <= NOT(A(2));
A_BAR_3 <= NOT(A(3));

B_BAR_0 <= NOT(B(0));
B_BAR_1 <= NOT(B(1));
B_BAR_2 <= NOT(B(2));
B_BAR_3 <= NOT(B(3));

S(0) <= EN AND ((A_BAR_0 AND B(0)) OR (A(0) AND B_BAR_0));
S(1) <= EN AND ((A_BAR_1 AND B(1)) OR (A(1) AND B_BAR_1));
S(2) <= EN AND ((A_BAR_2 AND B(2)) OR (A(2) AND B_BAR_2));
S(3) <= EN AND ((A_BAR_3 AND B(3)) OR (A(3) AND B_BAR_3));

end Behavioral;
