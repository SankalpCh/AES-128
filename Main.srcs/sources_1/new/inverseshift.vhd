----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.03.2018 10:06:22
-- Design Name: 
-- Module Name: inverseshift - Behavioral
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
entity inverseshift is
    Port ( a : in STD_LOGIC_VECTOR (0 to 127);
           b : out STD_LOGIC_VECTOR (0 to 127));
end inverseshift;

architecture Behavioral of inverseshift is
type inte is array (0 to 15) of integer range 0 to 15;
type matrix_t is array (0 to 15) of std_logic_vector (0 to 7);
signal matt: matrix_t;
signal I: integer;
signal m1 : inte;
begin
process(a)
begin
matt ( 0 to 3 ) <= (a( 0 to 7), a(32 to 39), a(64 to 71), a(96 to 103));
matt ( 4 to 7 ) <= ( a(104  to 111), a(8 to 15), a(40  to 47), a(72  to 79));
matt ( 8 to 11 ) <= ( a(80  to 87), a(112 to 119), a(16 to 23), a(48 to 55));
matt ( 12 to 15 ) <= ( a(56  to 63), a(88  to 95), a(120  to 127),a(24  to 31));
end process;


process
begin
m1 (0 to 15) <=( 0,4,8,12,1,5,9,13,2,6,10,14,3,7,11,15);
wait;
end process;
process(matt)
begin
for I in 0 to 15 loop
b((8*I) to ((8*(I+1))-1))<=matt(m1(I));
end loop;
end  process;
end Behavioral;
