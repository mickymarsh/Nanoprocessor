----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2024 10:03:58 PM
-- Design Name: 
-- Module Name: TB_D_FF - Behavioral
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

entity TB_D_FF is
--  Port ( );
end TB_D_FF;

architecture Behavioral of TB_D_FF is

component D_FF
    Port (
    D : in STD_LOGIC;
    Res : in STD_LOGIC;
    Clk : in STD_LOGIC;
    En : in STD_LOGIC;
    Q : out STD_LOGIC
);
end component;

SIGNAL D,Res,Clk, En : STD_LOGIC;
SIGNAL Q : STD_LOGIC;

begin

UUT : D_FF PORT MAP(
    D=>D,
    Res=>Res,
    Clk=>Clk,
    Q=>Q,
    En => En
);

process 
begin
    Clk<='1';
    wait for 10 ns;
    
    Clk<='0';
    wait for 10 ns;
end process;


process 
begin 
    D <= '1';
    Res <= '1';
    En <= '1';
    wait for 100 ns;

    D <= '0';
    Res <='0';
    wait for 100 ns;
    
    D <= '1';
    wait for 100 ns;
    
    D <= '0';
    En <= '0';
    wait for 100 ns;
    
    D <= '0';
    Res <='0';
    En <= '1';
    wait for 100 ns;
    
    D <= '1';
    wait for 100 ns;
    
    wait;
    
end process;
end Behavioral;
