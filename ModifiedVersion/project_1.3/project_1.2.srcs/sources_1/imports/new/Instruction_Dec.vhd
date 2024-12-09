----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2024 09:41:35 AM
-- Design Name: 
-- Module Name: Instruction_Dec - Behavioral
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

entity Instruction_Dec is
    Port (OpCode:  in STD_LOGIC_VECTOR(13 downto 0);
          JumpRegisterValue:  in STD_LOGIC_VECTOR(3 downto 0);
          JumpFlag: out STD_LOGIC;
          JumpAddress: Out STD_LOGIC_VECTOR(3 downto 0);
          AddOrSubstract : out STD_LOGIC;
          MuxEnable1: Out STD_LOGIC;
          MuxEnable2: Out STD_LOGIC;
          isNegative: out STD_LOGIC;
          MuxControlSignal1: Out STD_LOGIC_VECTOR(2 downto 0);
          MuxControlSignal2: Out STD_LOGIC_VECTOR(2 downto 0);
          ImmediateValue   : Out STD_LOGIC_VECTOR(3 downto 0);
          Load: out STD_LOGIC_VECTOR(1 DOWNTO 0);
          ComparatorEn : out STD_LOGIC;
          BooleanOp :out STD_LOGIC_VECTOR(1 DOWNTO 0);
          LoadEn :out STD_LOGIC;
          AddSubsractEnable : Out STD_LOGIC);
end Instruction_Dec;

architecture Behavioral of Instruction_Dec is

begin

ImmediateValue   <= OpCode(3 downto 0);
--Load(0)          <= NOT((Opcode(13) AND OpCode(12)) OR (NOT OpCode(12) AND OpCode(11) AND NOT OpCode(10)));
Load(0)          <= (NOT Opcode(13) AND Opcode(12)) OR (NOT Opcode(13) AND NOT Opcode(11));
Load(1)          <= (OpCode(13) AND OpCode(12)) OR (OpCode(12) AND OpCode(11) AND NOT OpCode(10));
MuxEnable1       <= OpCode(13) OR OpCode(12) OR NOT OpCode(11) OR OpCode(10);
MuxEnable2       <= OpCode(13) OR OpCode(12) OR NOT OpCode(11); 
MuxControlSignal1 <= OpCode(9 downto 7);
MuxControlSignal2 <= OpCode(6 downto 4);
AddOrSubstract    <= (NOT OpCode(13) AND OpCode(12)AND NOT OpCode(11) AND NOT OpCode(10)) OR 
                     (NOT OpCode(13) AND NOT OpCode(12) AND NOT OpCode(11) AND OpCode(10)) OR
                     (NOT OpCode(13) AND OpCode(12)AND OpCode(11) AND OpCode(10));
JumpAddress       <= OpCode(3 downto 0);  
JumpFlag          <= (NOT(JumpRegisterValue(0) OR JumpRegisterValue(1) OR JumpRegisterValue(2) OR JumpRegisterValue(3))) AND
                     (NOT OpCode(13) AND NOT OpCode(12) AND Opcode(10) AND OpCode(11));
AddSubsractEnable <= (NOT OpCode(13) AND NOT OpCode(11)) OR (NOT OpCode(13) AND OpCode(10) AND OpCode(12) );
IsNegative        <= NOT Opcode(13) AND NOT Opcode(12) AND NOT Opcode(11) AND Opcode(10);
BooleanOp         <= OpCode(11 downto 10);
ComparatorEn      <= OpCode(13) AND NOT OpCode(12) AND NOT OpCode(11) AND NOT OpCode(10);
LoadEn            <= OpCode(12) OR (NOT OpCode(13) AND NOT OpCode(10)) OR (NOT OpCode(13) AND NOT OpCode(11));

end Behavioral;
