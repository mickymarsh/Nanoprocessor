----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2024 10:22:36 AM
-- Design Name: 
-- Module Name: TB_Reg_Bank - Behavioral
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

entity TB_Reg_Bank is
--  Port ( );
end TB_Reg_Bank;

architecture Behavioral of TB_Reg_Bank is

component Reg_Bank
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           I : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           CLR : in STD_LOGIC;
           R0 : out STD_LOGIC_VECTOR (3 downto 0);
           R1 : out STD_LOGIC_VECTOR (3 downto 0);
           R2 : out STD_LOGIC_VECTOR (3 downto 0);
           R3 : out STD_LOGIC_VECTOR (3 downto 0);
           R4 : out STD_LOGIC_VECTOR (3 downto 0);
           R5 : out STD_LOGIC_VECTOR (3 downto 0);
           R6 : out STD_LOGIC_VECTOR (3 downto 0);
           R7 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal D : STD_LOGIC_VECTOR (3 downto 0);
signal I : STD_LOGIC_VECTOR (2 downto 0);
signal CLK : STD_LOGIC;
signal CLR : STD_LOGIC;
signal R0 : STD_LOGIC_VECTOR (3 downto 0);
signal R1 : STD_LOGIC_VECTOR (3 downto 0);
signal R2 : STD_LOGIC_VECTOR (3 downto 0);
signal R3 : STD_LOGIC_VECTOR (3 downto 0);
signal R4 : STD_LOGIC_VECTOR (3 downto 0);
signal R5 : STD_LOGIC_VECTOR (3 downto 0);
signal R6 : STD_LOGIC_VECTOR (3 downto 0);
signal R7 : STD_LOGIC_VECTOR (3 downto 0);

begin

UUT: Reg_Bank 
port map(
            D => D,
            I => I, 
            Clk => Clk, 
            CLR => CLR,
            R0 => R0,
            R1 => R1,
            R2 => R2,
            R3 => R3,
            R4 => R4,
            R5 => R5,
            R6 => R6,
            R7 => R7
       );

process 
begin
    clk<='1';
    wait for 10 ns;
    
    clk<='0';
    wait for 10 ns;
end process;
--11  0101 1101  0011 0101
process
begin
    CLR <= '1';        
    D <= "0101";
    I <= "010"; 
            
    wait for 150ns;
    CLR <= '0';
    D <= "0011";
    I <= "011"; 
                        
    wait for 150ns;
    D <= "1101";
    I <= "100"; 
    
    wait for 150 ns;
    D <= "0111";
    I <= "101"; 
    
    wait for 150 ns;
    D <= "1011";
    I <= "111"; 
    wait;
          
    end process;

end Behavioral;