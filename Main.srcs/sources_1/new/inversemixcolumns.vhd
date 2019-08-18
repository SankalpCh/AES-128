----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.03.2018 10:22:59
-- Design Name: 
-- Module Name: inversemixcolumns - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity inversemixcolumns is
    Port ( a : in STD_LOGIC_VECTOR (0 to 127);
           b : out STD_LOGIC_VECTOR (0 to 127));
end inversemixcolumns;


architecture Behavioral of inversemixcolumns is
function shft (g: std_logic_vector (0 to 7)) return std_logic_vector is
begin
if g(0)='0' then
return std_logic_vector(unsigned (g) sll 1);
else
return ( std_logic_vector( unsigned (g) sll 1) xor X"1b");
end if;
end shft;
type t1 is array (0 to 15) of std_logic_vector(0 to 7);
signal t, p: t1;
begin
process (a)
begin
for I in 0 to 15 loop
t(I)<=a((8*I) to ((8*(I+1))-1));
end loop;
end process;
process (t)
begin
for i in 0 to 3 loop
p(i) <= (shft(shft(shft(t(4*i)) xor t(4*i)) xor t(4*i))) xor (shft(shft(shft(t((4*i)+1))) xor t((4*i)+1)) xor t((4*i)+1)) xor (shft(shft(shft(t((4*i)+2)) xor t((4*i)+2))) xor t((4*i)+2)) xor (shft(shft(shft(t((4*i)+3)))) xor t((4*i)+3));
p(i+4)<= (shft(shft(shft(t(4*i)))) xor t(4*i))xor (shft(shft(shft(t((4*i)+1)) xor t((4*i)+1)) xor t((4*i)+1))) xor (shft(shft(shft(t((4*i)+2))) xor t((4*i)+2)) xor t((4*i)+2)) xor (shft(shft(shft(t((4*i)+3)) xor t((4*i)+3))) xor t((4*i)+3));
p(i+8)<= (shft(shft(shft(t(4*i)) xor t(4*i))) xor t((4*i))) xor (shft(shft(shft(t((4*i)+1)))) xor t((4*i)+1))xor (shft(shft(shft(t((4*i)+2)) xor t((4*i)+2)) xor t((4*i)+2))) xor (shft(shft(shft(t((4*i)+3))) xor t((4*i)+3)) xor t((4*i)+3));
p(i+12)<=(shft(shft(shft(t(4*i))) xor t(4*i)) xor t(4*i)) xor (shft(shft(shft(t((4*i)+1)) xor t((4*i)+1))) xor t((4*i)+1)) xor (shft(shft(shft(t((4*i)+2)))) xor t((4*i)+2))xor (shft(shft(shft(t((4*i)+3)) xor t((4*i)+3)) xor t((4*i)+3)));
end loop;
end process;
process (p)
begin
for I in 0 to 15 loop
b((8*I) to ((8*(I+1))-1)) <= p((4*I mod 16)+(I/4));
end loop;
end process;
end Behavioral;
