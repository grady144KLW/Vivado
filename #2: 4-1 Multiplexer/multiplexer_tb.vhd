-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 21.10.2020 09:58:56 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_multiplexer is
end tb_multiplexer;

architecture tb of tb_multiplexer is

    component multiplexer
        port (a       : in std_logic;
              b       : in std_logic;
              c       : in std_logic;
              d       : in std_logic;
              control : in std_logic_vector (1 downto 0);
              z       : out std_logic);
    end component;

    signal a       : std_logic;
    signal b       : std_logic;
    signal c       : std_logic;
    signal d       : std_logic;
    signal control : std_logic_vector (1 downto 0);
    signal z       : std_logic;

begin

    dut : multiplexer
    port map (a       => a,
              b       => b,
              c       => c,
              d       => d,
              control => control,
              z       => z);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        a <= '0';
        b <= '0';
        c <= '0';
        d <= '0';
        control <= (others => '0');
        wait for 10 ns;
        a <= '1';
        b <= '0';
        c <= '0';
        d <= '0';
        control <= "00";
        wait for 10 ns;
        a <= '0';
        b <= '1';
        c <= '0';
        d <= '0';
        control <= "01";
        wait for 10 ns;
        a <= '0';
        b <= '0';
        c <= '1';
        d <= '0';
        control <= "10";
        wait for 10 ns;
        a <= '0';
        b <= '0';
        c <= '0';
        d <= '1';
        control <= "11";
        
        wait;
    end process;

end tb;