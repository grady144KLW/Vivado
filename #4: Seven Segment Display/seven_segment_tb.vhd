LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_bcd_7seg IS
END tb_bcd_7seg;
 
ARCHITECTURE behavior OF tb_bcd_7seg IS
 
constant clk_period: time := 10 ns; -- setting the clock period to 10 ns
 
COMPONENT bcd_7segment
PORT(
    reset: in std_logic;
    clk: in std_logic;
    BCD_in : IN std_logic_vector(3 downto 0); -- 4 inputs 
    seg_out : OUT std_logic_vector(6 downto 0)-- 7 outputs
);
END COMPONENT;
 
-- declaring signals for the inputs and the outputs of the seven segment
signal reset: std_logic := '0';
signal clk: std_logic := '1';
signal BCD_in : std_logic_vector(3 downto 0) := (others => '0'); -- assigning the switches to 0
signal seg_out : std_logic_vector(6 downto 0);
 
BEGIN
 
uut: bcd_7segment PORT MAP (
reset => reset,
clk => clk,
BCD_in => BCD_in,
seg_out => seg_out
);

clk <= not clk after clk_period / 2;
 
stim_proc: process -- process is used to read the code vertically
begin

-- these are the inputs of the seven_segment from 0-9
 
BCD_in <= "0000"; -- 0
wait for 100 ns;
BCD_in <= "0001"; -- 1
wait for 100 ns;
BCD_in <= "0010"; -- 2
wait for 100 ns;
BCD_in <= "0011"; -- 3
wait for 100 ns;
BCD_in <= "0100"; -- 4
wait for 100 ns;
BCD_in <= "0101"; -- 5
wait for 100 ns;
BCD_in <= "0101"; -- 6
wait for 100 ns; 
BCD_in <= "0111"; -- 7
wait for 100 ns;
BCD_in <= "1000"; -- 8 
wait for 100 ns;
BCD_in <= "1001"; -- 9
wait for 100 ns;
end process;
 
END;
