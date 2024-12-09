library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_InstructionDecoder is
end TB_InstructionDecoder;

architecture Behavioral of TB_InstructionDecoder is

    -- Signals
    signal OpCode : std_logic_vector(11 downto 0) := (others => '0');
    signal JumpRegisterValue : std_logic_vector(3 downto 0) := "0000";

    -- Add signals to capture outputs from the module
    signal JumpFlag : std_logic;
    signal JumpAddress : std_logic_vector(2 downto 0);
    signal AddOrSubstract : std_logic;
    signal MuxEnable1 : std_logic;
    signal MuxEnable2 : std_logic;
    signal MuxControlSignal1 : std_logic_vector(2 downto 0);
    signal MuxControlSignal2 : std_logic_vector(2 downto 0);
    signal AddSubsractEnable : STD_LOGIC;

    --signal RegisterBankEnable : std_logic;
    signal ImmediateValue : std_logic_vector(3 downto 0);
    signal Load : std_logic;
    signal RegisterToEnable : std_logic_vector(2 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut : entity work.Instruction_Dec
        port map (
            OpCode => OpCode,
            JumpRegisterValue => JumpRegisterValue,
            JumpFlag => JumpFlag,
            JumpAddress => JumpAddress,
            AddOrSubstract => AddOrSubstract,
            MuxEnable1 => MuxEnable1,
            MuxEnable2 => MuxEnable2,
            MuxControlSignal1 => MuxControlSignal1,
            MuxControlSignal2 => MuxControlSignal2,
            --RegisterBankEnable => RegisterBankEnable,
            ImmediateValue => ImmediateValue,
            Load => Load,
            AddSubsractEnable => AddSubsractEnable,
            RegisterToEnable => RegisterToEnable
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Provide stimulus values here, for example:
        OpCode <= "101010001011";  -- Sample OpCode value
        JumpRegisterValue <= "0010";  -- Sample JumpRegisterValue value
        wait for 100 ns;
        
        -- Add more stimulus if needed
        OpCode <= "101110000101";  -- MOV R7 5
        JumpRegisterValue <= "0011";  -- Sample JumpRegisterValue value
        wait for 100 ns;
        
        OpCode <= "001110110000";  -- ADD R7 R3
        JumpRegisterValue <= "0000"; 
        wait for 100 ns;
        
        OpCode <= "011110000000";  -- NEG R7
        JumpRegisterValue <= "1110";  -- Sample JumpRegisterValue value
        wait for 100 ns;
        
        OpCode <= "111010000011";  -- JUMP R5 011
        JumpRegisterValue <= "0000";  -- Sample JumpRegisterValue value
        wait for 100 ns;
        
        -- End the simulation
        wait;
    end process;

end Behavioral;
