----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2024 09:09:16 AM
-- Design Name: 
-- Module Name: Top_Multiplier - Behavioral
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
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top_Multiplier is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Y_1 : out STD_LOGIC_VECTOR (7 downto 0)
           );
end Top_Multiplier;

architecture Behavioral of Top_Multiplier is
component Multiplier_4_4
    Port (
       A : in STD_LOGIC_VECTOR (3 downto 0);
       B : in STD_LOGIC_VECTOR (3 downto 0);
       Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal AA,AAA,BB,BBB : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal my_integer1,my_integer1_1,my_integer2,my_integer2_1,my_integer3,my_integer3_1,Y_int,A3,B3 : integer;
signal result_vector : std_logic_vector(3 downto 0);
signal Y,YY,YYY : STD_LOGIC_VECTOR (7 downto 0);
signal Y_logic : STD_LOGIC;

function std_logic_to_integer(signal_value : std_logic) return integer is
begin
    if signal_value = '1' then
        return 1;
    else
        return 0;
    end if;
end function;

begin

process (AA,BB,A,B)
begin
    for i in 0 to 3 loop
        AA(i) <= A(i) XOR A(3);
        BB(i) <= B(i) XOR B(3);
    end loop;
end process;

A3 <= std_logic_to_integer(A(3));
B3 <= std_logic_to_integer(B(3));

my_integer1 <= to_integer(unsigned(AA));
my_integer1_1 <= my_integer1 + A3;
AAA <= std_logic_vector(to_unsigned(my_integer1_1, AA'length));

my_integer2 <= to_integer(unsigned(BB));
my_integer2_1 <= my_integer2 + B3;
BBB <= std_logic_vector(to_unsigned(my_integer2_1, BB'length));

Multiplier_4_4_1 : Multiplier_4_4
port map (
A => AAA,
B => BBB,
Y => YY
);

Y_logic <= A(3) XOR B(3);
Y_int <= std_logic_to_integer(Y_logic);

process (YY,Y)
begin
    for i in 0 to 7 loop
        Y(i) <= YY(i) XOR Y_logic;
    end loop;
end process;

my_integer3 <= to_integer(unsigned(Y));
my_integer3_1 <= my_integer3 + Y_int;
YYY <= std_logic_vector(to_unsigned(my_integer3_1, Y'length));

Y_1 <= YYY;
end Behavioral;
