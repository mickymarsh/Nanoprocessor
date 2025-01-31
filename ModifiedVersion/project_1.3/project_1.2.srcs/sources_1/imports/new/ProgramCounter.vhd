----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2024 07:13:02 AM
-- Design Name: 
-- Module Name: ProgramCounter - Behavioral
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

entity ProgramCounter is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           CLR : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end ProgramCounter;

architecture Behavioral of ProgramCounter is

component D_FF
    port(
        D : in STD_LOGIC;
        Res : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Q : out STD_LOGIC;
        En : in STD_LOGIC
    );

end component;

begin

D_FF_0 : D_FF
    port map(
        D => D(0),
        Res => CLR,
        Clk => Clk,
        Q => Q(0),
        En => '1'

    );    
D_FF_1 : D_FF
    port map(
        D => D(1),
        Res => CLR,
        Clk => Clk,
        Q =>Q(1),
        En => '1'
    );
    
D_FF_2 : D_FF
    port map(
        D => D(2),
        Res => CLR,
        Clk => Clk,
        Q =>Q(2),
        En => '1'
      
    );
D_FF_3 : D_FF
    port map(
        D => D(3),
        Res => CLR,
        Clk => Clk,
        Q =>Q(3),
        En => '1'
          
    );


end Behavioral;
