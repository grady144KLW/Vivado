library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity bcd_7segment is
Port ( 
        reset : in std_logic; -- resets the segments
        clk : in std_Logic; -- synchronizing the information
        BCD_in : in STD_LOGIC_VECTOR (3 downto 0); -- four inputs from the decoder 
        seg_out : out STD_LOGIC_VECTOR (6 downto 0)); -- seven outputs from the seven segment
end bcd_7segment;
 
architecture Behavioral of bcd_7segment is
 
begin
 
process(clk) -- process is used to read the code vertically
begin
 if (rising_edge(clk)) then
    if reset = '1' then -- if reset is selected 
        seg_out <= "1111111"; -- assign the segments to nothing
    else
    
    case BCD_in is
        when "0000" => -- when the switch is at 0
        seg_out <= "0000001"; -- put the segments to display 0
        
        when "0001" => -- when the switch is at 1
        seg_out <= "1001111"; -- put the segments to display 1

        when "0010" => -- when the switch is at 2
        seg_out <= "0010010"; -- put the segments to display 2

        when "0011" => -- when the switch is at 3
        seg_out <= "0000110"; -- put the segments to display 3

        when "0100" => -- when the switch is at 4
        seg_out <= "1001100"; -- put the segments to display 4

        when "0101" => -- when the switch is at 5
        seg_out <= "0100100"; -- put the segments to display 5

        when "0110" => -- when the switch is at 6
        seg_out <= "0100000"; -- put the segments to display 6

        when "0111" => -- when the switch is at 7
        seg_out <= "0001111"; -- put the segments to display 7

        when "1000" => -- when the switch is at 8
        seg_out <= "0000000"; -- put the segments to display 8

        when "1001" => -- when the switch is at 9
        seg_out <= "0000100"; -- put the segments to display 9

        when others => -- when the switch is assigned any number outside of 0-9
        seg_out <= "1111111"; -- don't display anything on the seven segement 

    end case;
    end if;
 end if; 
end process;
end Behavioral;
