----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2024 06:48:17 AM
-- Design Name: 
-- Module Name: TB_fourBitAdder - Behavioral
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

entity TB_fourBitAdder is
--  Port ( );
end TB_fourBitAdder;

architecture Behavioral of TB_fourBitAdder is

component fourBitAdder
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
       S : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal a,s : std_logic_vector (3 downto 0);


begin

uut : fourBitAdder
    port map (
        A => a,
        S => s
    );

process 
begin 
 a <= "0000";
wait for 100ns;

a <= "0001";
wait for 100ns;

a <= "0010";
wait for 100ns;

a <= "0111";
wait for 100ns;

a <= "1111";
wait for 100ns;

wait;

end process;


end Behavioral;
