----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2024 03:05:53 PM
-- Design Name: 
-- Module Name: sim_4_bit_adder_substactor - Behavioral
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

entity TB_AdderSubstractor is
--  Port ( );
end TB_AdderSubstractor;

architecture Behavioral of TB_AdderSubstractor is
component Fourbit_Adder_Substrator
 Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
          B : in STD_LOGIC_VECTOR (3 downto 0);
          S : out STD_LOGIC_VECTOR (3 downto 0);
          M : in STD_LOGIC;
          En : in STD_LOGIC;
          V : out STD_LOGIC;
          Zero : out STD_LOGIC
          );
end component;

signal a,b,s :STD_LOGIC_VECTOR (3 downto 0);
signal m,v,zero, en : std_logic ;


begin
uut : Fourbit_Adder_Substrator
port map (
A => a,
B => b,
En =>en,
M => m,
V => v,
S => s,
Zero => zero
);

process begin

a <= "1011";
b <= "0110";
m <= '0';
en <= '1';
wait for 100ns;

a <= "0110";
b <= "1001";
m <= '1';
en <= '0';
wait for 100ns;
a <= "0100";
b <= "0001";
m <= '1';
wait for 100ns;
a <= "0010";
b <= "0001";
m <= '0';
en <= '1';
wait for 100ns;

a <= "1000";
b <= "0001";
m <= '0';
wait for 100ns;
a <= "0000";
b <= "0100";
m <= '1';
wait for 100ns;

a <= "0000";
b <= "0100";
m <= '1';
wait for 100ns;

a <= "0000";
b <= "0000";
m <= '0';
wait for 100ns;

wait;
end process;

end Behavioral;
