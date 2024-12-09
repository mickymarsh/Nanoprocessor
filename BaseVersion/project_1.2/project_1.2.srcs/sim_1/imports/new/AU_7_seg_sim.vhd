----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/22/2024 09:55:57 PM
-- Design Name: 
-- Module Name: AU_7_seg_sim - Behavioral
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

entity TB_SevenSegmentDisplay is
--  Port ( );
end TB_SevenSegmentDisplay;

architecture Behavioral of TB_SevenSegmentDisplay is

COMPONENT SevenSegmentDisplay is
    Port ( Data : in STD_LOGIC_VECTOR (3 downto 0);
           S_LED : out STD_LOGIC_VECTOR (3 downto 0);
           S_7Seg : out STD_LOGIC_VECTOR (6 downto 0));
end COMPONENT;

SIGNAL Data,S_LED : std_logic_vector (3 downto 0);
SIGNAL S_7Seg : std_logic_vector (6 downto 0);

begin

    UUT: SevenSegmentDisplay PORT MAP(
    Data => Data,
    S_LED => S_LED,
    S_7Seg => S_7Seg
);

process
begin
    Data <= "1101";
    wait for 100 ns;
    
    Data <= "1001";
    wait for 100 ns;
      
    Data <= "0111";
    wait for 100 ns;
            
    Data <= "0110";
    wait for 100 ns;
    
   -- WAIT; -- WILL WAIT FOREVER
end process;

end Behavioral;
