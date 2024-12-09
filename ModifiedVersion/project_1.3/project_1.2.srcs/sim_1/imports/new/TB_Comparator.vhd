----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2024 12:33:35 PM
-- Design Name: 
-- Module Name: TB_Comparator - Behavioral
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

entity TB_Comparator is
--  Port ( );
end TB_Comparator;

architecture Behavioral of TB_Comparator is

COMPONENT Comparator is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           less : out STD_LOGIC;
           equal : out STD_LOGIC;
           greater : out STD_LOGIC);
end COMPONENT;

signal Data_A,Data_B :STD_LOGIC_VECTOR (3 downto 0);
signal EN,less,equal,greater : std_logic ;

begin

uut : Comparator
port map (
A => Data_A,
B => Data_B,
En => EN,
less => less,
equal => equal,
greater => greater
);

process begin

Data_A <= "1011";
Data_B <= "0011";
EN <= '0';
wait for 100ns;

Data_A <= "1011";
Data_B <= "0011";
EN <= '1';
wait for 100ns;

Data_A <= "0111";
Data_B <= "0100";
wait for 100ns;

Data_A <= "0110";
Data_B <= "1110";
wait for 100ns;

Data_A <= "1100";
Data_B <= "1111";
wait for 100ns;

Data_A <= "1101";
Data_B <= "1101";
wait for 100ns;

wait;
end process;

end Behavioral;
