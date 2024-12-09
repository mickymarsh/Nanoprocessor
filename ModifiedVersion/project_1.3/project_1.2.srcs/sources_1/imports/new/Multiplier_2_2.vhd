----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2024 04:16:53 PM
-- Design Name: 
-- Module Name: Multiplier_2_2 - Behavioral
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

entity Multiplier_2_2 is
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Multiplier_2_2;

architecture Behavioral of Multiplier_2_2 is
component FA
 port (
 A: in std_logic;
 B: in std_logic;
 C_IN: in std_logic;
 S: out std_logic;
 C_OUT: out std_logic);
 end component;

SIGNAL A0B0, A0B1, A1B0, A1B1, C_0_0, C_0_1 ,S_0_0, S_0_1 : STD_LOGIC;

begin
FA_0_0: FA port map(
A => A0B1,
B => A1B0,
C_IN => '0',
S => S_0_0,
C_OUT => C_0_0
);

FA_0_1 : FA PORT MAP(
A => '0',
B => A1B1,
C_IN => C_0_0,
S => S_0_1,
C_OUT => C_0_1
);

A0B0 <= A(0) AND B(0);
A1B0 <= A(1) AND B(0);
A0B1 <= A(0) AND B(1);
A1B1 <= A(1) AND B(1);

Y(0) <= A0B0;
Y(1) <= S_0_0;
Y(2) <= S_0_1;
Y(3) <= C_0_1;

end Behavioral;
