----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2024 10:55:52 PM
-- Design Name: 
-- Module Name: ProgramCounter_sim - Behavioral
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

entity TB_ProgramCounter is
--  Port ( );
end TB_ProgramCounter;

architecture Behavioral of TB_ProgramCounter is

component ProgramCounter is
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           CLR : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal Clk : STD_LOGIC:='0';
signal CLR: STD_LOGIC;
signal D, Q:STD_LOGIC_VECTOR (2 downto 0);

begin

UUT: ProgramCounter 
    PORT MAP (
        D=>D,
        CLR=>CLR,
        Clk=>Clk,
        Q=>Q
    );
    
process 

begin 
    Clk<=NOT(Clk);
    wait for 5 ns;
end process;

process
begin

    CLR <= '1';
    wait for 80 ns;
    
    CLR <= '0';
    --D <= "100";
    wait for 80 ns;
    
    D <= "011";
    wait for 80 ns;
    
    D <= "101";
    wait for 80 ns;
    
    CLR <= '1';
    D <= "100";
    wait for 80 ns;
    
    D <= "011";
    wait for 80 ns;
    
    D <= "111";
    wait for 80 ns;
    
end process;

end Behavioral;
