----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/22/2024 09:59:53 PM
-- Design Name: 
-- Module Name: LUT_8_7_sim - Behavioral
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

entity TB_LUT is
--  Port ( );
end TB_LUT;

architecture Behavioral of TB_LUT is

COMPONENT LUT_Display
    PORT( address : IN STD_LOGIC_VECTOR (2 downto 0);
          data : OUT STD_LOGIC_VECTOR (6 downto 0));
END COMPONENT;
SIGNAL address : std_logic_vector (2 downto 0);
SIGNAL data : std_logic_vector (6 downto 0);

begin

    UUT: LUT_Display PORT MAP(
    address(0) => address(0),
    address(1) => address(1),
    address(2) => address(2),
    data(0) => data(0),
    data(1) => data(1),
    data(2) => data(2),
    data(3) => data(3),
    data(4) => data(4),
    data(5) => data(5),
    data(6) => data(6)
);

process
begin
    address <= "101";
    wait for 100 ns;
    
    address <= "001";
    wait for 100 ns;
      
    address <= "111";
    wait for 100 ns;
            
    address <= "110";
    wait for 100 ns;
    
   -- WAIT; -- WILL WAIT FOREVER
end process;

end Behavioral;
