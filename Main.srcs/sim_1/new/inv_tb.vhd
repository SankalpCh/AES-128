----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2018 09:19:28
-- Design Name: 
-- Module Name: inv_tb - Behavioral
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
use work.arq.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity inv_tb is
end inv_tb;

architecture Behavioral of inv_tb is
component subtrans is
    Port ( a : in STD_LOGIC_VECTOR (0 to 127);
          b : out STD_LOGIC_VECTOR (0 to 127));
end component;
component shiftrows is
    Port (
     a : in std_logic_vector (0 to 127);
     b : out std_logic_vector (0 to 127));
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
signal a :  std_logic_vector (0 to 127);
signal b :  std_logic_vector (0 to 127);
--signal Keys1-10: arr;
begin
--u1 : roundkygn port map ( x => a , y => Keys1-10);
--u2 : subtrans port map ( a => a, b => b);
u3 : shiftrows port map( a => a , b => b);
--u4 : mixcolumns port map ( a => a, b => b);

process 
begin
-- for Round keys to generate.
--a <= X"5468617473206D79204B756E67204675";
--for Subbytes Transformation.
--a <= X"001f0e543c4e08596e221b0b4774311a";
-- for Shift Rows Transformation.
a <= X"63c0ab20eb2f30cb9f93af2ba092c7a2";
-- for Mix Columns Transformation.
--a <= X"632fafa2eb93c7209f92abcba0c0302b";
wait;
end process;
end Behavioral;
