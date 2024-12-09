----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2024 01:54:02 PM
-- Design Name: 
-- Module Name: 4_bit_Adder_Substrator - Behavioral
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

entity Fourbit_Adder_Substrator is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           M : in STD_LOGIC;
           V : out STD_LOGIC;
           Zero : out STD_LOGIC
           );
end Fourbit_Adder_Substrator;

architecture Behavioral of Fourbit_Adder_Substrator is
component RCA_4
    Port ( A0 : in STD_LOGIC;
       A1 : in STD_LOGIC;
       A2 : in STD_LOGIC;
       A3 : in STD_LOGIC;
       B0 : in STD_LOGIC;
       B1 : in STD_LOGIC;
       B2 : in STD_LOGIC;
       B3 : in STD_LOGIC;
       C_IN : in STD_LOGIC;
       S0 : out STD_LOGIC;
       S1 : out STD_LOGIC;
       S2 : out STD_LOGIC;
       S3 : out STD_LOGIC;
       C_OUT3 : out STD_LOGIC;
       C_OUT4 : out STD_LOGIC);

end component;

SIGNAL X,Y :STD_LOGIC;
SIGNAL BB, Temp: STD_LOGIC_VECTOR(3 DOWNTO 0);

begin

process (B, M)
begin
    for i in 0 to B'length-1 loop
        BB(i) <= B(i) XOR M;
    end loop;
end process;

RCA_4_1 : RCA_4
PORT MAP (
A0 => A(0),
A1 => A(1),
A2 => A(2),
A3 => A(3),
B0 => BB(0),
B1 => BB(1),
B2 => BB(2),
B3 => BB(3),
C_IN => M,
S0 => Temp(0),
S1 => Temp(1),
S2 => Temp(2),
S3 => Temp(3),
C_OUT3 => X,
C_OUT4 => Y
);

S <= Temp;
V <= (X XOR Y);
Zero <= En AND NOT(Temp(0) OR Temp(1) OR Temp(2) OR Temp(3) OR Y); 

end Behavioral;
