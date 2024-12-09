----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2024 06:33:30 PM
-- Design Name: 
-- Module Name: Boolean_operator - Behavioral
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

entity Boolean_operator is
    Port ( Input : in STD_LOGIC_VECTOR (1 downto 0);
           Data_A : in STD_LOGIC_VECTOR (3 downto 0);
           Data_B : in STD_LOGIC_VECTOR (3 downto 0);
           S_out : out STD_LOGIC_VECTOR (3 downto 0));
end Boolean_operator;

architecture Behavioral of Boolean_operator is

component Decoder_2_to_4
    port(
    I : in STD_LOGIC_VECTOR (1 downto 0);
    EN : in STD_LOGIC;
    Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component AND_operator is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component OR_operator is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component NOT_operator is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component XOR_operator is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal AND_signal, OR_signal, NOT_signal, XOR_signal : STD_LOGIC;
signal decoder_output, AND_operator_output, OR_operator_output, NOT_operator_output, XOR_operator_output : STD_LOGIC_VECTOR (3 downto 0);

begin

Decoder_2_to_4_0: Decoder_2_to_4
     port map(
        I=> Input,
        EN => '1',
        Y => decoder_output); 
        --00 - decoder_output(0)->AND
        --01 - decoder_output(1)->OR
        --10 - decoder_output(2)->NOT
        --11 - decoder_output(3)->XOR
        
AND_operator_0: AND_operator
    PORT MAP(
    A => Data_A,
    B => Data_B,
    EN => decoder_output(0),
    S => AND_operator_output);
    
OR_operator_0: OR_operator
        PORT MAP(
        A => Data_A,
        B => Data_B,
        EN => decoder_output(1),
        S => OR_operator_output);
        
NOR_operator_0: NOT_operator
            PORT MAP(
            A => Data_A,
            EN => decoder_output(2),
            S => NOT_operator_output);
        
XOR_operator_0: XOR_operator
            PORT MAP(
            A => Data_A,
            B => Data_B,
            EN => decoder_output(3),
            S => XOR_operator_output);
            
S_out <= AND_operator_output OR OR_operator_output OR NOT_operator_output OR XOR_operator_output;

end Behavioral;
