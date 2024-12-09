----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2024 11:26:41 AM
-- Design Name: 
-- Module Name: TB_Sim_Top_Multiplier - Behavioral
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

entity TB_Sim_Top_Multiplier is
--  Port ( );
end TB_Sim_Top_Multiplier;

architecture Behavioral of TB_Sim_Top_Multiplier is
COMPONENT Top_Multiplier
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Y_1 : out STD_LOGIC_VECTOR (7 downto 0)
          );           
END COMPONENT;

SIGNAL A : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL B : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL Y_1 : STD_LOGIC_VECTOR (7 downto 0);

begin

UUT: Top_Multiplier 
PORT MAP(
A => A,
B => B,
Y_1 => Y_1
);

PROCESS BEGIN
A <= "0111";
B <= "0111";
WAIT FOR 100NS;
A <= "1111";
B <= "0001";
WAIT FOR 100NS;
A <= "0000";
B <= "1111";
WAIT FOR 100NS;
A <= "0010";
B <= "1111";
WAIT FOR 100NS;
A <= "0111";
B <= "1111";
WAIT FOR 100NS;
A <= "1001";
B <= "1111";
WAIT FOR 100NS;
A <= "0101";
B <= "1111";
WAIT FOR 100NS;
A <= "1111";
B <= "1111";

WAIT;


END PROCESS;


end Behavioral;
