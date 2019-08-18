----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2018 17:44:56
-- Design Name: 
-- Module Name: roundkygn - Behavioral
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


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.arq.all;
entity roundkygn is
    Port ( x : in STD_LOGIC_VECTOR (0 to 127);
            y: out arr);
end roundkygn;
architecture Behavioral of roundkygn is
type at is array(1 to 10) of std_logic_vector(0 to 7);
signal u: at:= ( X"01", X"02", X"04", X"08", X"10", X"20", X"40", X"80", X"1b", X"36"); 
signal k: arr;
signal p: STD_LOGIC_VECTOR (0 to 127);

component roundkeys is
    Port ( a : in STD_LOGIC_VECTOR (0 to 127);
           b : out STD_LOGIC_VECTOR (0 to 127);
           o : in std_logic_vector (0 to 7));
end component;
begin
p <= x;
g1: roundkeys port map ( a => p , b => k(1), o => u(1));
g2: roundkeys port map (a => k(1) , b => k(2), o => u(2));
g3: roundkeys port map (a => k(2) , b => k(3), o => u(3));
g4: roundkeys port map (a => k(3) , b => k(4), o => u(4));
g5: roundkeys port map (a => k(4) , b => k(5), o => u(5));
g6: roundkeys port map (a => k(5) , b => k(6), o => u(6));
g7: roundkeys port map (a => k(6) , b => k(7), o => u(7));
g8: roundkeys port map (a => k(7) , b => k(8), o => u(8));
g9: roundkeys port map (a => k(8) , b => k(9), o => u(9));
g10: roundkeys port map (a => k(9) , b => k(10), o => u(10));
process (k)
begin
for i in 1 to 10 loop
y(i)<=k(i);
end loop;
end process;

end Behavioral;
