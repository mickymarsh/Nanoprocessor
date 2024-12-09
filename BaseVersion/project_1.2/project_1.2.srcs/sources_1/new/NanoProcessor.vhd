----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2024 07:41:34 AM
-- Design Name: 
-- Module Name: NanoProcessor - Behavioral
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

entity NanoProcessor is
    Port ( Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           R7_LED : out STD_LOGIC_VECTOR (3 downto 0);
           R7_Display: out STD_LOGIC_VECTOR(6 downto 0);
           Anode : out STD_LOGIC_VECTOR(3 downto 0));
           
end NanoProcessor;

architecture Behavioral of NanoProcessor is

component ProgramRom
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component ProgramCounter
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           CLR : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component ThreeBitAdder
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

component Two_3_bit_MUX
    Port ( D1 : in STD_LOGIC_VECTOR (2 downto 0);
       D2 : in STD_LOGIC_VECTOR (2 downto 0);
       EN : in STD_LOGIC;
       S : in STD_LOGIC;
       Y : OUT STD_LOGIC_VECTOR (2 downto 0));
end component;

component Instruction_Dec
    Port (OpCode: in STD_LOGIC_VECTOR(11 downto 0);
      JumpRegisterValue:  in STD_LOGIC_VECTOR(3 downto 0);
      JumpFlag: out STD_LOGIC;
      JumpAddress: Out STD_LOGIC_VECTOR(2 downto 0);
      AddOrSubstract : out STD_LOGIC;
      MuxEnable1: Out STD_LOGIC;
      MuxEnable2: Out STD_LOGIC;
      MuxControlSignal1: Out STD_LOGIC_VECTOR(2 downto 0);
      MuxControlSignal2: Out STD_LOGIC_VECTOR(2 downto 0);
      ImmediateValue : Out STD_LOGIC_VECTOR(3 downto 0);
      Load: out STD_LOGIC;
      RegisterToEnable : Out STD_LOGIC_VECTOR(2 downto 0);
      AddSubsractEnable : Out STD_LOGIC);
end component;

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

component Two_4bit_MUX
    Port ( D1 : in STD_LOGIC_VECTOR (3 downto 0);
       D2 : in STD_LOGIC_VECTOR (3 downto 0);
       S : in STD_LOGIC;
       EN : in STD_LOGIC;
       Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Fourbit_Adder_Substrator
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
       B : in STD_LOGIC_VECTOR (3 downto 0);
       S : out STD_LOGIC_VECTOR (3 downto 0);
       En : in STD_LOGIC;
       M : in STD_LOGIC;
       V : out STD_LOGIC;
       Zero : out STD_LOGIC
       );
end component;

component Mux_8_to_1
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
       D_1 : in STD_LOGIC_VECTOR (3 downto 0);
       D_2 : in STD_LOGIC_VECTOR (3 downto 0);
       D_3 : in STD_LOGIC_VECTOR (3 downto 0);
       D_4 : in STD_LOGIC_VECTOR (3 downto 0);
       D_5 : in STD_LOGIC_VECTOR (3 downto 0);
       D_6 : in STD_LOGIC_VECTOR (3 downto 0);
       D_7 : in STD_LOGIC_VECTOR (3 downto 0);
       D_8 : in STD_LOGIC_VECTOR (3 downto 0);
       EN : in STD_LOGIC;
       Y_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component SevenSegmentDisplay
    Port ( Data : in STD_LOGIC_VECTOR (3 downto 0);
       S_LED : out STD_LOGIC_VECTOR (3 downto 0);
       S_7Seg : out STD_LOGIC_VECTOR (6 downto 0));
end component;
   
signal PC, J_Address, Address, PC_in, sel1, sel2, enable: STD_LOGIC_VECTOR (2 downto 0);
signal Instruction: STD_LOGIC_VECTOR (11 downto 0);
signal Slow_Clock, J_Flag, operation, Load_from, Mux_En1, Mux_En2,AddSubEn: STD_LOGIC;
signal register1, register2, R_0, R_1, R_2, R_3, R_4, R_5, R_6, R_7, Value, result, data : STD_LOGIC_VECTOR (3 downto 0);
      
begin
InstructionDecoder: Instruction_Dec
        port map (OpCode => Instruction,
                  JumpRegisterValue =>register2,
                  JumpFlag => J_Flag,
                  JumpAddress => J_Address,
                  AddOrSubstract => operation,
                  MuxEnable1 =>Mux_En1,
                  MuxEnable2 =>Mux_En2,
                  MuxControlSignal1 => Sel1,
                  MuxControlSignal2 => Sel2,
                  ImmediateValue => Value,
                  Load => load_from,
                  RegisterToEnable => enable,
                  AddSubsractEnable => AddSubEn);


Clock0 : Slow_Clk
    port map(
        Clk_in => Clk,
        Clk_out => Slow_Clock);
        
ProgramCounter0 : ProgramCounter
    port map(
        D      =>PC_in,
        Clk    =>Slow_Clock,
        CLR    =>Reset,
        Q      =>PC); 
        
Adder0 :ThreeBitAdder
    port map(
        A => PC,
        S => Address);
        
ProgramRom0 : ProgramRom
    port map(
        address =>PC,
        data    =>Instruction);

two_3_MUX :Two_3_bit_MUX
    port map(
         D1 =>Address,
         D2 =>J_Address,
         EN =>'1',
         S  =>J_Flag,
         Y  => PC_in);       

two_4_MUX :Two_4bit_MUX
    port map(
        D1 =>result,
        D2 =>Value,
        EN =>'1',
        S  =>load_from,
        Y  => data);
        
RegisterBank: Reg_Bank
    port map(
           D    =>data, 
           I    =>enable,
           Clk  =>Slow_Clock,
           CLR  =>Reset,
           R0   =>R_0,
           R1   =>R_1, 
           R2   =>R_2,
           R3   =>R_3,
           R4   =>R_4,
           R5   =>R_5,
           R6   =>R_6,
           R7   =>R_7);
        
mux_8_to_4_0 :Mux_8_to_1
    port map(
        S       =>sel1,
        D_1     =>R_0,
        D_2     =>R_1,
        D_3     =>R_2,
        D_4     =>R_3,
        D_5     =>R_4,
        D_6     =>R_5,
        D_7     =>R_6,
        D_8     =>R_7,
        EN      =>Mux_En1,
        Y_out   =>register2);
        
mux_8_to_4_1 :Mux_8_to_1
    port map(
        S       =>sel2,
        D_1     =>R_0,
        D_2     =>R_1,
        D_3     =>R_2,
        D_4     =>R_3,
        D_5     =>R_4,
        D_6     =>R_5,
        D_7     =>R_6,
        D_8     =>R_7,
        EN      =>Mux_En2,
        Y_out   =>register1);
        
Adder_Substractor : Fourbit_Adder_Substrator
    port map(
        A       =>register1,
        B       =>register2,
        S       =>result,
        En      => AddSubEn,
        M       =>operation,
        V       =>Overflow,
        Zero    => Zero);
        
SevenSegmentDisplay0 : SevenSegmentDisplay
    port map(
        Data    =>R_7,
        S_LED   =>R7_LED,
        S_7Seg  =>R7_Display);
        
Anode <= "1110";
        
end Behavioral; 
