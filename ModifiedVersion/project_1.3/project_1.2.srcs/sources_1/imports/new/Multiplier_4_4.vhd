----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2024 05:24:55 PM
-- Design Name: 
-- Module Name: Multiplier_4_4 - Behavioral
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

entity Multiplier_4_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end Multiplier_4_4;

architecture Behavioral of Multiplier_4_4 is
COMPONENT Multiplier_2_2
Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
       B : in STD_LOGIC_VECTOR (1 downto 0);
       Y : out STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

COMPONENT FA_6
 Port ( A : in STD_LOGIC_VECTOR (5 downto 0);
          B : in STD_LOGIC_VECTOR (5 downto 0);
          Y : OUT STD_LOGIC_VECTOR (6 downto 0));
END COMPONENT;

SIGNAL V0,V1,V2,V3 : STD_LOGIC_VECTOR(3 DOWNTO 0) ;
SIGNAL V5,V6,V7 : STD_LOGIC_VECTOR(6 DOWNTO 0) ;
begin
Multiplier_2_2_0 : Multiplier_2_2 port map(
A => A(1 DOWNTO 0),
B => B(1 DOWNTO 0),
Y => V0(3 DOWNTO 0)
);
Multiplier_2_2_1 : Multiplier_2_2 port map(--V1
A => A(3 DOWNTO 2),
B => B(1 DOWNTO 0),
Y => V1(3 DOWNTO 0)
);
Multiplier_2_2_2 : Multiplier_2_2 port map(--V2
A => A(1 DOWNTO 0),
B => B(3 DOWNTO 2),
Y => V2(3 DOWNTO 0)
);
Multiplier_2_2_3 : Multiplier_2_2 port map(
A => A(3 DOWNTO 2),
B => B(3 DOWNTO 2),
Y => V3(3 DOWNTO 0)
);
FA_6_0 :FA_6 PORT MAP(
A(1 DOWNTO 0) => V0(3 DOWNTO 2),
A(5 DOWNTO 2) => "0000",
B(5 DOWNTO 4) => "00",
B(3 DOWNTO 0) => V1,
Y => V5(6 DOWNTO 0)
);
FA_6_1 :FA_6 PORT MAP(
A(3 DOWNTO 0) => V2,
A(5 DOWNTO 4) => "00",
B(1 DOWNTO 0) => "00",
B(5 DOWNTO 2) => V3,
Y => V6(6 DOWNTO 0)
);
FA_6_2 :FA_6 PORT MAP(
A => V5(5 DOWNTO 0),
B => V6(5 DOWNTO 0),
Y => V7(6 DOWNTO 0)
);

Y(7 DOWNTO 2) <= V7(5 DOWNTO 0);
Y(1 DOWNTO 0) <= V0(1 DOWNTO 0);

end Behavioral;
