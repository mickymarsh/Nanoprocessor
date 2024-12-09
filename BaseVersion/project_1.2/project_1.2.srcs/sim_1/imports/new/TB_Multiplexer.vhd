----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2024 11:32:42 PM
-- Design Name: 
-- Module Name: TB_Multiplexer - Behavioral
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

entity TB_Two_3_MUX is
--  Port ( );
end TB_Two_3_MUX;

architecture Behavioral of TB_Two_3_MUX is

COMPONENT Two_3_bit_MUX
    PORT(D1 : in STD_LOGIC_VECTOR (2 downto 0);
        D2 : in STD_LOGIC_VECTOR (2 downto 0);
        S : in STD_LOGIC;
        EN : in STD_LOGIC;
        Y : out STD_LOGIC_VECTOR (2 downto 0));
END COMPONENT;

SIGNAL D1: STD_LOGIC_VECTOR (2 downto 0);
SIGNAL D2: STD_LOGIC_VECTOR (2 downto 0);
SIGNAL S : STD_LOGIC;
SIGNAL EN : STD_LOGIC;
SIGNAL Y : STD_LOGIC_VECTOR (2 downto 0);

begin

UUT: Two_3_bit_MUX PORT MAP(
D1=>D1,
D2=>D2,
S=>S,
EN=>EN,
Y=>Y
);

process
begin

EN<='1';
D1 <= "010";
D2 <= "011";
S <= '0';

WAIT FOR 100 ns;
S <= '1';

WAIT FOR 100 ns;



end process;

end Behavioral;
