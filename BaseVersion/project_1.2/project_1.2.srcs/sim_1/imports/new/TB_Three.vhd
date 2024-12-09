----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2024 04:50:25 PM
-- Design Name: 
-- Module Name: SIM_ThreebitAdder - Behavioral
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

entity TB_ThreebitAdder is
--  Port ( );
end TB_ThreebitAdder;

architecture Behavioral of TB_ThreebitAdder is
component ThreebitAdder
Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal a,s : std_logic_vector (2 downto 0);

begin
uut : ThreebitAdder
port map (
A => a,
S => s
);

process begin 
 a <= "000";
wait for 100ns;

a <= "001";
wait for 100ns;

a <= "010";
wait for 100ns;

a <= "111";
wait for 100ns;

wait;

end process;
end Behavioral;