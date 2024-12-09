----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2024 11:07:34 AM
-- Design Name: 
-- Module Name: TB_Mux_8_to_1 - Behavioral
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

entity TB_Mux_8_to_1 is
--  Port ( );
end TB_Mux_8_to_1;

architecture Behavioral of TB_Mux_8_to_1 is

component Mux_8_to_1 is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           D_1 : in STD_LOGIC_VECTOR (3 downto 0);
           D_2 : in STD_LOGIC_VECTOR (3 downto 0);
           D_3 : in STD_LOGIC_VECTOR (3 downto 0);
           D_4 : in STD_LOGIC_VECTOR (3 downto 0);
           D_5 : in STD_LOGIC_VECTOR (3 downto 0);
           D_6 : in STD_LOGIC_VECTOR (3 downto 0);
           D_7 : in STD_LOGIC_VECTOR (3 downto 0);
           D_8 : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           Y_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal S : STD_LOGIC_VECTOR (2 downto 0);
signal D_1 : STD_LOGIC_VECTOR (3 downto 0);
signal D_2 : STD_LOGIC_VECTOR (3 downto 0);
signal D_3 : STD_LOGIC_VECTOR (3 downto 0);
signal D_4 : STD_LOGIC_VECTOR (3 downto 0);
signal D_5 : STD_LOGIC_VECTOR (3 downto 0);
signal D_6 : STD_LOGIC_VECTOR (3 downto 0);
signal D_7 : STD_LOGIC_VECTOR (3 downto 0);
signal D_8 : STD_LOGIC_VECTOR (3 downto 0);
signal EN : STD_LOGIC;
signal Y_out : STD_LOGIC_VECTOR (3 downto 0);

begin

UUT : Mux_8_to_1
    PORT MAP(
        S => S,
        D_1 => D_1,
        D_2 => D_2,
        D_3 => D_3,
        D_4 => D_4,
        D_5 => D_5,
        D_6 => D_6,
        D_7 => D_7,
        D_8 => D_8,
        EN => EN,
        Y_out => Y_out
    );
process
    begin
    
            EN <= '1';
            D_1 <= "0101";
            D_2 <= "0110";
            D_3 <= "1111";
            D_4 <= "1001";
            D_5 <= "1010";
            D_6 <= "1100";
            D_7 <= "0011";
            D_8 <= "1110";
            S <= "000";
            
            WAIT FOR 100 ns;
            S <= "001";
            
            WAIT FOR 100 ns;
            S <= "010";
            
            WAIT FOR 100 ns;
            S <= "011";
            
            WAIT FOR 100 ns;
            S <= "100";
            
            WAIT FOR 100 ns;
            S <= "101";
            
            WAIT FOR 100 ns;
            S <= "110";
            
            WAIT FOR 100 ns;
            S <= "111";
            
            WAIT;
    
    end process;
end Behavioral;
