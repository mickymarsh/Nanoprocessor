----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2024 11:53:08 PM
-- Design Name: 
-- Module Name: Multiplexer - Behavioral
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

entity Two_3_bit_MUX is
    Port ( D1 : in STD_LOGIC_VECTOR (2 downto 0);
           D2 : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           S : in STD_LOGIC;
           Y : OUT STD_LOGIC_VECTOR (2 downto 0));
end Two_3_bit_MUX;

architecture Behavioral of Two_3_bit_MUX is

begin

Y(0) <= EN AND ((D1(0) AND NOT(S)) OR (D2(0) AND S));
Y(1) <= EN AND ((D1(1) AND NOT(S)) OR (D2(1) AND S));
Y(2) <= EN AND ((D1(2) AND NOT(S)) OR (D2(2) AND S));

end Behavioral;
