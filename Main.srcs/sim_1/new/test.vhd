----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2018 21:57:56
-- Design Name: 
-- Module Name: test - Behavioral
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

entity test is
end test;

architecture Behavioral of test is
component AES is
    Port ( x : in STD_LOGIC_VECTOR (0 to 127);
           key1 : in STD_LOGIC_VECTOR (0 to 127);
           y : out STD_LOGIC_VECTOR (0 to 127));
end component;

signal plain_in : STD_LOGIC_VECTOR (0 to 127);
signal key2 : STD_LOGIC_VECTOR (0 to 127);
signal plain_out: STD_LOGIC_VECTOR (0 to 127);
begin
u1: AES port map ( x => plain_in, key1 => key2, y => plain_out );
process
begin
plain_in <= X"54776F204F6E65204E696E652054776F";
key2 <= X"5468617473206D79204B756E67204675";
wait;
end process;
end Behavioral;