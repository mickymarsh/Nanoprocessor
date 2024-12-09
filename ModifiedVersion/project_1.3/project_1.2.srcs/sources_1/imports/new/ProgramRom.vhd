----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2024 06:58:08 AM
-- Design Name: 
-- Module Name: ProgramRom - Behavioral
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
use ieee.numeric_std.all; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ProgramRom is
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (13 downto 0));
end ProgramRom;

architecture Behavioral of ProgramRom is

type rom_type is array (0 to 11) of std_logic_vector(13 downto 0);
signal instruction_ROM : rom_type := (
    "00100100000010",       -- MOV R2 2
    "00101110000001",       -- MOV R7 1
    "01101110100000",       -- MUL R7 R2
    "01101110100000",       -- MUL R7 R2
    "00001110100000",       -- ADD R7 R2
    "01011110010000",       -- INC R7
    "01001110100000",       -- SUB R7 R2
    "01001110100000",       -- SUB R7 R2
    "00101100000001",       -- MOV R6 1
    "11001111100000",       -- AND R7 R6
    "10000101110000",       -- COMP R2 R7
    "00110110001011"        -- JZR R3 11
);

begin

data <= instruction_ROM(to_integer(unsigned(address)));
 
end Behavioral;
