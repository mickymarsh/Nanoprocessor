----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2024 06:40:33 AM
-- Design Name: 
-- Module Name: fourBitAdder - Behavioral
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

entity fourBitAdder is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0));
end fourBitAdder;

architecture Behavioral of fourBitAdder is

component FA
    port (
        A: in std_logic;
        B: in std_logic;
        C_IN: in std_logic;
        S: out std_logic;
        C_OUT: out std_logic);
 end component;
 
SIGNAL FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C, FA3_S, FA3_C  : std_logic := '0';

begin

FA_0 : FA
    port map (
        A => A(0),
        B => '0',
        C_IN => '1',
        S => S(0),
        C_OUT => FA0_C);
 
 FA_1 : FA
    port map (
        A => A(1),
        B => '0',
        C_IN => FA0_C,
        S => S(1),
        C_OUT => FA1_C);
 
 FA_2 : FA
    port map (
        A => A(2),
        B => '0',
        C_IN => FA1_C,
        S => S(2),
        C_OUT => FA2_C);


FA_3 : FA
    port map (
        A => A(3),
        B => '0',
        C_IN => FA2_C,
        S => S(3),
        C_OUT => FA3_C);
end Behavioral;