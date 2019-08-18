----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2018 19:52:37
-- Design Name: 
-- Module Name: ss_tb - Behavioral
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
package ary is
type arr is array(1 to 10) of std_logic_vector(0 to 127);
end package;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.ary.all;
--use ieee.std_logic_arith.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ss_tb is
end ss_tb;

architecture Behavioral of ss_tb is
component subtrans is
    Port ( a : in STD_LOGIC_VECTOR (0 to 127);
          b : out STD_LOGIC_VECTOR (0 to 127));
end component;
component shiftrows is
    Port (
     a : in std_logic_vector (0 to 127);
     b : out std_logic_vector (0 to 127));
end component;
component roundkeys is
    Port ( 
            a : in STD_LOGIC_VECTOR (0 to 127);
            b : out STD_LOGIC_VECTOR (0 to 127);
            o : in std_logic_vector (0 to 7));
end component;
component addroundkey is
    Port ( a : in STD_LOGIC_VECTOR (0 to 127);
           b : in STD_LOGIC_VECTOR (0 to 127);
           c : out STD_LOGIC_VECTOR (0 to 127));
end component;
component mixcolumns is
    Port ( a : in STD_LOGIC_VECTOR (0 to 127);
           b : out STD_LOGIC_VECTOR (0 to 127));
end component;
component roundkygn is
    Port ( x : in STD_LOGIC_VECTOR (0 to 127);
            y: out arr);
end component;
signal a : std_logic_vector (0 to 127);
signal b : arr;
--signal o : std_logic_vector (0 to 7);
begin
--g1 : subtrans port map (a => a, b => b);
--g1 : shiftrows port map ( a => a , b => b);
--g1 : addroundkey port  map (a => a, b => b, c => c);
g1: roundkygn port map ( x => a, y => b);
--g1: roundkeys port map ( a => a , b => b, o => o);
process
begin
--a <= X"63C0AB20EB2F30CB9F93AF2BA092C7A2";-- for shift rows
--a<= X"001F0E543C4E08596E221B0B4774311A";-- for subbytes
--a <= X"5468617473206D79204B756E67204675";--for add round key
--b <= X"54776F204F6E65204E696E652054776F";-- for add round key
--a<=X"632fafa2eb93c7209f92abcba0c0302b";--for mix columns
a<= X"5468617473206D79204B756E67204675";
--a<= X"E232FCF191129188B159E4E6D679A293";
--o<=X"02";
wait;
end process;
end Behavioral;
