library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Instruction_Dec is
end TB_Instruction_Dec;

architecture Behavioral of TB_Instruction_Dec is

COMPONENT Instruction_Dec is
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
          LoadEn :out STD_LOGIC;
          BooleanOp :out STD_LOGIC_VECTOR(1 DOWNTO 0);
          AddSubsractEnable : Out STD_LOGIC);
end COMPONENT;

    -- Signals declaration
    signal OpCode            : STD_LOGIC_VECTOR(13 downto 0);
    signal JumpRegisterValue : STD_LOGIC_VECTOR(3 downto 0);
    signal JumpFlag          : STD_LOGIC;
    signal JumpAddress       : STD_LOGIC_VECTOR(3 downto 0);
    signal AddOrSubstract    : STD_LOGIC;
    signal MuxEnable1        : STD_LOGIC;
    signal MuxEnable2        : STD_LOGIC;
    signal IsNegative        : STD_LOGIC;
    signal MuxControlSignal1 : STD_LOGIC_VECTOR(2 downto 0);
    signal MuxControlSignal2 : STD_LOGIC_VECTOR(2 downto 0);
    signal ImmediateValue    : STD_LOGIC_VECTOR(3 downto 0);
    signal Load              : STD_LOGIC_VECTOR(1 DOWNTO 0);
    signal ComparatorEn      : STD_LOGIC;
    signal BooleanOp         : STD_LOGIC_VECTOR(1 DOWNTO 0);
    signal AddSubsractEnable : STD_LOGIC;
    signal LoadEn            : STD_LOGIC;

begin

    UUT: Instruction_Dec port map (
        OpCode            => OpCode,
        JumpRegisterValue => JumpRegisterValue,
        JumpFlag          => JumpFlag,
        JumpAddress       => JumpAddress,
        AddOrSubstract    => AddOrSubstract,
        MuxEnable1        => MuxEnable1,
        MuxEnable2        => MuxEnable2,
        IsNegative        => IsNegative,
        MuxControlSignal1 => MuxControlSignal1,
        MuxControlSignal2 => MuxControlSignal2,
        ImmediateValue    => ImmediateValue,
        Load              => Load,
        ComparatorEn      => ComparatorEn,
        BooleanOp         => BooleanOp,
        LoadEn            => LoadEn,
        AddSubsractEnable=> AddSubsractEnable
    );

    process
    begin
        
        OpCode <= "00101110001010"; --MOV R7 10
        JumpRegisterValue <= "1101";
        wait for 100 ns;
        
        OpCode <= "00001101110000"; --ADD R6 R7
        JumpRegisterValue <= "1001";
        wait for 100 ns;
        
        OpCode <= "00010001100000"; --NEG R6
        JumpRegisterValue <= "1001";
        wait for 100 ns;
        
        OpCode <= "00110110001011"; --JZR R3 1011
        JumpRegisterValue <= "1001";
        wait for 100 ns;
        
        OpCode <= "10001111100000"; --COMP R7 R6
        JumpRegisterValue <= "1001";
        wait for 100 ns;
        
        OpCode <= "01101010110000"; --MUL R5 R3
        JumpRegisterValue <= "1001";
        wait;
    end process Stimulus_Process;

end Behavioral;
