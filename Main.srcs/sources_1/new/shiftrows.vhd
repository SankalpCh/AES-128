----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2018 22:51:56
-- Design Name: 
-- Module Name: shiftrows - Behavioral
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
-- arithmetic functions with Signed or unsto_unsignedlues
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shiftrows is
    Port (
     a : in std_logic_vector (0 to 127);
     b : out std_logic_vector (0 to 127));
end shiftrows;

architecture Behavioral of shiftrows is
type inte is array (0 to 15) of integer range 0 to 15;
type matrix_t is array (0 to 15) of std_logic_vector (0 to 7);
signal matt: matrix_t;
signal I: integer;
signal m1 : inte;
begin
process(a)
begin
matt ( 0 to 3 ) <= (a( 0 to 7), a(32 to 39), a(64 to 71), a(96 to 103));
matt ( 4 to 7 ) <= ( a(40  to 47), a(72  to 79), a(104  to 111), a(8 to 15));
matt ( 8 to 11 ) <= ( a(80  to 87), a(112 to 119), a(16 to 23), a(48 to 55));
matt ( 12 to 15 ) <= ( a(120  to 127), a(24  to 31), a(56  to 63), a(88  to 95));
end process;

process
begin
m1 (0 to 15) <=(0,4,8,12,1,5,9,13,2,6,10,14,3,7,11,15);
wait;
end process;
process(m1,matt)
begin
for I in 0 to 15 loop
b((8*I) to ((8*(I+1))-1))<=matt(m1(I));
end loop;
end  process;
end Behavioral;
