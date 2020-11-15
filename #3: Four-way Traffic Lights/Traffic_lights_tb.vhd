
library ieee;
use ieee.std_logic_1164.all;

entity tb_Traffic_Lights is
end tb_Traffic_Lights;

architecture tb of tb_Traffic_Lights is

constant clk_period: time := 10 ns; -- set the clock period to 10 ns

    component Traffic_Lights is generic (seconds: integer);
        port (reset     : in std_logic;
              clk       : in std_logic;
              red_NS    : out std_logic;
              yellow_NS : out std_logic;
              green_NS  : out std_logic;
              red_WE    : out std_logic;
              yellow_WE : out std_logic;
              green_WE  : out std_logic);
    end component;

    signal reset     : std_logic := '0';
    signal clk       : std_logic := '1';
    signal red_NS    : std_logic;
    signal yellow_NS : std_logic;
    signal green_NS  : std_logic;
    signal red_WE    : std_logic;
    signal yellow_WE : std_logic;
    signal green_WE  : std_logic;

begin

    uut : Traffic_Lights
    generic map (seconds => 100000000) -- converting nanoseconds to seconds
    port map (reset     => reset,
              clk       => clk,
              red_NS    => red_NS,
              yellow_NS => yellow_NS,
              green_NS  => green_NS,
              red_WE    => red_WE,
              yellow_WE => yellow_WE,
              green_WE  => green_WE);

clk <= not clk after clk_period / 2; -- divides the clock 

    stimuli : process
    begin



        wait;
    end process;

end tb;

