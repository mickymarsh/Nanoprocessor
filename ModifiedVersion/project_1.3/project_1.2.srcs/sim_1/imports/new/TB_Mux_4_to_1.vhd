----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2024 04:09:47 PM
-- Design Name: 
-- Module Name: TB_Mux_4_to_1 - Behavioral
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

entity TB_Mux_4_to_1 is
--  Port ( );
end TB_Mux_4_to_1;

architecture Behavioral of TB_Mux_4_to_1 is

component Mux_4_to_1 is
    Port ( S : in STD_LOGIC_VECTOR (1 downto 0);
           D_1 : in STD_LOGIC_VECTOR (3 downto 0);
           D_2 : in STD_LOGIC_VECTOR (3 downto 0);
           D_3 : in STD_LOGIC_VECTOR (3 downto 0);
           D_4 : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           Y_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal S : STD_LOGIC_VECTOR (1 downto 0);
signal D_1 : STD_LOGIC_VECTOR (3 downto 0);
signal D_2 : STD_LOGIC_VECTOR (3 downto 0);
signal D_3 : STD_LOGIC_VECTOR (3 downto 0);
signal D_4 : STD_LOGIC_VECTOR (3 downto 0);
signal EN : STD_LOGIC;
signal Y_out : STD_LOGIC_VECTOR (3 downto 0);

begin

UUT : Mux_4_to_1
    PORT MAP(
        S => S,
        D_1 => D_1,
        D_2 => D_2,
        D_3 => D_3,
        D_4 => D_4,
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
            S <= "00";
            
            WAIT FOR 100 ns;
            S <= "01";
            
            WAIT FOR 100 ns;
            S <= "10";
            
            WAIT FOR 100 ns;
            EN <='0';
            S <= "11";
            
            WAIT;
    
    end process;

end Behavioral;
