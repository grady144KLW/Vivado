----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/15/2020 05:48:08 AM
-- Design Name: 
-- Module Name: dfdsdfv - Behavioral
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

entity and_gate is

port 
( 
       a: in std_logic; -- declaring a as an input
       b: in std_logic; -- declaring b as an input
       c: out std_logic -- declaring c as an output
);

end and_gate;

architecture Behavioral of and_gate is

begin

c <= a and b; -- this will create an and gate

end Behavioral;
