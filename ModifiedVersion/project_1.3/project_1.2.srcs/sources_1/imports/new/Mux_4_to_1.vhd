----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2024 03:58:54 PM
-- Design Name: 
-- Module Name: Mux_4_to_1 - Behavioral
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

entity Mux_4_to_1 is
    Port ( S : in STD_LOGIC_VECTOR (1 downto 0);
           D_1 : in STD_LOGIC_VECTOR (3 downto 0);
           D_2 : in STD_LOGIC_VECTOR (3 downto 0);
           D_3 : in STD_LOGIC_VECTOR (3 downto 0);
           D_4 : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           Y_out : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_4_to_1;

architecture Behavioral of Mux_4_to_1 is

component Decoder_2_to_4
    port(
        I : in STD_LOGIC_VECTOR(1 downto 0);
        EN : in STD_LOGIC;
        Y : OUT STD_LOGIC_VECTOR(3 downto 0) );
end component;

signal Decoder_Output : STD_LOGIC_VECTOR(3 downto 0);

begin

Decoder : Decoder_2_to_4
    port map (
        I  => S,
        EN => EN,
        Y  => Decoder_Output
    );
    Y_out(0) <= EN AND ((D_1(0) AND Decoder_Output(0)) OR (D_2(0) AND Decoder_Output(1)) OR (D_3(0) AND Decoder_Output(2)) OR (D_4(0) AND Decoder_Output(3)));
    Y_out(1) <= EN AND ((D_1(1) AND Decoder_Output(0)) OR (D_2(1) AND Decoder_Output(1)) OR (D_3(1) AND Decoder_Output(2)) OR (D_4(1) AND Decoder_Output(3)));
    Y_out(2) <= EN AND ((D_1(2) AND Decoder_Output(0)) OR (D_2(2) AND Decoder_Output(1)) OR (D_3(2) AND Decoder_Output(2)) OR (D_4(2) AND Decoder_Output(3)));
    Y_out(3) <= EN AND ((D_1(3) AND Decoder_Output(0)) OR (D_2(3) AND Decoder_Output(1)) OR (D_3(3) AND Decoder_Output(2)) OR (D_4(3) AND Decoder_Output(3)));

end Behavioral;
