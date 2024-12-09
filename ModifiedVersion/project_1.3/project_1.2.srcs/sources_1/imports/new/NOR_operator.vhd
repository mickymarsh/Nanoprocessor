----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2024 05:52:57 PM
-- Design Name: 
-- Module Name: NOR_operator - Behavioral
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

entity NOT_operator is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end NOT_operator;

architecture Behavioral of NOT_operator is

begin

S(0) <= EN AND NOT(A(0));
S(1) <= EN AND NOT(A(1));
S(2) <= EN AND NOT(A(2));
S(3) <= EN AND NOT(A(3));

end Behavioral;
