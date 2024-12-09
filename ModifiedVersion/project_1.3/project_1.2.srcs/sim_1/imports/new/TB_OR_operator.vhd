----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2024 05:30:16 PM
-- Design Name: 
-- Module Name: TB_AND_operator - Behavioral
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

entity TB_OR_operator is
--  Port ( );
end TB_OR_operator;

architecture Behavioral of TB_OR_operator is

COMPONENT OR_operator is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT;

SIGNAL EN : STD_LOGIC;
SIGNAL A,B,S : STD_LOGIC_VECTOR (3 downto 0);

begin

UUT: OR_operator PORT MAP(
    A => A,
    B => B,
    EN => EN,
    S => S
);

process
begin
        A <= "0000";
        B <= "0110";
        EN <= '0';
        
        WAIT FOR 100 ns;
        A <= "1010";
        B <= "0110";
        
        WAIT FOR 100 ns;
        A <= "1111";
        B <= "1110";
        
        WAIT FOR 100 ns;
        A <= "0000";
        B <= "0110";
        EN <= '1';
        
        WAIT FOR 100 ns;
        A <= "1010";
        B <= "0110";
        
        WAIT FOR 100 ns;
        A <= "1111";
        B <= "1110";
        
        WAIT;
end process;

end Behavioral;
