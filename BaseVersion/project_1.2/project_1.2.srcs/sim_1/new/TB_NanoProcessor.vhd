-- Testbench for NanoProcessor

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_NanoProcessor is
end TB_NanoProcessor;

architecture testbench of TB_NanoProcessor is

component NanoProcessor
    Port ( Reset : in STD_LOGIC;
       Clk : in STD_LOGIC;
       Overflow : out STD_LOGIC;
       Zero : out STD_LOGIC;
       R7_LED : out STD_LOGIC_VECTOR (3 downto 0);
       R7_Display: out STD_LOGIC_VECTOR(6 downto 0);
       Anode: out STD_LOGIC_VECTOR(3 downto 0));

end component;

    signal Reset, Overflow, Zero : std_logic;
    signal Clk : STD_LOGIC := '0';
    signal R7_Display: STD_LOGIC_VECTOR(6 downto 0);
    signal R7_LED, Anode : STD_LOGIC_VECTOR (3 downto 0);

begin

    UUT : NanoProcessor
        port map (
            Reset => Reset,
            Clk => Clk,
            Overflow => Overflow,
            Zero => Zero,
            R7_LED => R7_LED,
            R7_Display => R7_Display,
            Anode => Anode
        );

    clk_proc: process
    begin
        while now < 3000 ns loop
            Clk <= not Clk;
            wait for 5 ns;
        end loop;
        wait;
    end process;
    
    stimuli: process
    begin
    
      Reset <= '1';
      wait for 100 ns;
    
    Reset <='0';
--    wait for 600 ns;
    
--    Reset <='1';
--    wait for 100 ns;
    
--    Reset <= '0';
    wait;
    
    end process;

end testbench;
