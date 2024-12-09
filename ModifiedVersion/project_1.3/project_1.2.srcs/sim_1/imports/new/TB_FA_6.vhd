----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/28/2024 10:54:13 PM
-- Design Name: 
-- Module Name: TB_FA_6 - Behavioral
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

entity TB_FA_6 is
--  Port ( );
end TB_FA_6;

architecture Behavioral of TB_FA_6 is
COMPONENT FA_6
Port ( A : in STD_LOGIC_VECTOR (5 downto 0);
           B : in STD_LOGIC_VECTOR (5 downto 0);
           Y : OUT STD_LOGIC_VECTOR (6 downto 0));
END COMPONENT;
SIGNAL A : STD_LOGIC_VECTOR (5 downto 0);
SIGNAL B : STD_LOGIC_VECTOR (5 downto 0);
SIGNAL Y : STD_LOGIC_VECTOR (6 downto 0);

begin
UUT: FA_6 PORT MAP(
A =>A,
B =>B,
Y =>Y
);
PROCESS BEGIN
A <= "000001";
B <= "001111";
WAIT FOR 100NS;
A <= "111111";
B <= "000001";
WAIT FOR 100NS;
A <= "000110";
B <= "111110";
WAIT FOR 100NS;
A <= "000010";
B <= "001111";
WAIT FOR 100NS;
A <= "001111";
B <= "111011";
WAIT FOR 100NS;
A <= "100001";
B <= "110011";
WAIT FOR 100NS;
A <= "010011";
B <= "110111";
WAIT FOR 100NS;
A <= "111001";
B <= "111100";

WAIT;

END PROCESS;
end Behavioral;
