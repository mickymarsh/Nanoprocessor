----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2024 07:19:38 PM
-- Design Name: 
-- Module Name: TB_Boolean_operator - Behavioral
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

entity TB_Boolean_operator is
--  Port ( );
end TB_Boolean_operator;

architecture Behavioral of TB_Boolean_operator is

COMPONENT Boolean_operator is
    Port ( Input : in STD_LOGIC_VECTOR (1 downto 0);
           Data_A : in STD_LOGIC_VECTOR (3 downto 0);
           Data_B : in STD_LOGIC_VECTOR (3 downto 0);
           S_out : out STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT;

signal Input : STD_LOGIC_VECTOR (1 downto 0);
signal Data_A,Data_B,S_out : STD_LOGIC_VECTOR (3 downto 0);

begin

UUT: Boolean_operator PORT MAP(
    Input => Input,
    Data_A => Data_A,
    Data_B => Data_B,
    S_out => S_out
);

process
begin
        Data_A <= "1101";
        Input <= "10";
        
        WAIT FOR 100 ns;
        Data_B <= "1001";
        Input <= "01";
        
        WAIT FOR 100 ns;
        Input <= "00";
        
        WAIT FOR 100 ns;
        Input <= "11";
        
        WAIT FOR 100 ns;
        Data_A <= "1010";
        Data_B <= "0110";
        Input <= "00";
        
        WAIT FOR 100 ns;
        Input <= "01";
        
        WAIT FOR 100 ns;
        Input <= "10";
        
        WAIT FOR 100 ns;
        Input <= "11";
        
        WAIT;
end process;

end Behavioral;
