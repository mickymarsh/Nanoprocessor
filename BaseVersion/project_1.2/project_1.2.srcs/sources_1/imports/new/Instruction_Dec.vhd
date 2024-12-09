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
    Port (OpCode:  in STD_LOGIC_VECTOR(11 downto 0);
          JumpRegisterValue:  in STD_LOGIC_VECTOR(3 downto 0);
          JumpFlag: out STD_LOGIC;
          JumpAddress: Out STD_LOGIC_VECTOR(2 downto 0);
          AddOrSubstract : out STD_LOGIC;
          MuxEnable1: Out STD_LOGIC;
          MuxEnable2: Out STD_LOGIC;
          MuxControlSignal1: Out STD_LOGIC_VECTOR(2 downto 0);
          MuxControlSignal2: Out STD_LOGIC_VECTOR(2 downto 0);
          ImmediateValue   : Out STD_LOGIC_VECTOR(3 downto 0);
          Load: out STD_LOGIC;
          RegisterToEnable : Out STD_LOGIC_VECTOR(2 downto 0);
          AddSubsractEnable : Out STD_LOGIC);
end Instruction_Dec;

architecture Behavioral of Instruction_Dec is

begin

RegisterToEnable <= OpCode(9 DOWNTO 7);
ImmediateValue <= OpCode(3 downto 0);
Load <= OpCode(11) AND (NOT OpCode(10));  --loading mux will take immediate value when the control signal is 1
MuxEnable1 <= (NOT OpCode(11)) OR OpCode(10);
MuxEnable2 <= NOT OpCode(11);
MuxControlSignal1 <= OpCode(9 downto 7);
MuxControlSignal2 <= OpCode(6 downto 4);
AddOrSubstract <= (NOT OpCode(11)) AND OpCode(10);
JumpAddress <= OpCode(2 downto 0);  
JumpFlag <= (NOT(JumpRegisterValue(0) OR JumpRegisterValue(1) OR JumpRegisterValue(2) OR JumpRegisterValue(3))) AND (Opcode(10) AND OpCode(11));
AddSubsractEnable <=NOT OpCode(11);

end Behavioral;
