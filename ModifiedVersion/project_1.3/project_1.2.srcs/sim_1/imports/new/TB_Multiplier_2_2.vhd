----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2024 04:21:47 PM
-- Design Name: 
-- Module Name: TB_Multiplier_2_2 - Behavioral
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

entity TB_Multiplier_2_2 is
--  Port ( );
end TB_Multiplier_2_2;

architecture Behavioral of TB_Multiplier_2_2 is
COMPONENT Multiplier_2_2
Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
       B : in STD_LOGIC_VECTOR (1 downto 0);
       Y : out STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

SIGNAL A : STD_LOGIC_VECTOR (1 downto 0);
SIGNAL B : STD_LOGIC_VECTOR (1 downto 0);
SIGNAL Y : STD_LOGIC_VECTOR (3 downto 0);

begin
UUT: Multiplier_2_2 PORT MAP(
A => A,
B => B,
Y => Y);
PROCESS BEGIN
A <= "00";
B <= "01";
 
WAIT FOR 100NS;
A <= "01";
B <= "01";

WAIT FOR 100NS;
A <= "11";
B <= "01";

WAIT FOR 100NS;
A <= "01";
B <= "11";

WAIT FOR 100NS;
A <= "11";
B <= "11";

WAIT FOR 100NS;
A <= "10";
B <= "10";

WAIT FOR 100NS;
A <= "10";
B <= "11";

WAIT FOR 100NS;
A <= "00";
B <= "11";
WAIT;
END PROCESS;
end Behavioral;
