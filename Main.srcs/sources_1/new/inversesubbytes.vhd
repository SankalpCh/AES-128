----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.03.2018 10:16:18
-- Design Name: 
-- Module Name: inversesubbytes - Behavioral
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

entity inversesubbytes is
    Port ( a : in STD_LOGIC_VECTOR (0 to 127);
           b : out STD_LOGIC_VECTOR (0 to 127));
end inversesubbytes;

architecture Behavioral of inversesubbytes is
type inte is array (0 to 15) of integer range 0 to 255;
type matrix_t is array (0 to 255) of std_logic_vector(0 to 7);
signal matt: matrix_t:=(
    X"52", X"09", X"6A", X"D5", X"30", X"36", X"A5", X"38", X"BF", X"40", X"A3", X"9E", X"81", X"F3", X"D7", X"FB",
    X"7C", X"E3", X"39", X"82", X"9B", X"2F", X"FF", X"87", X"34", X"8E", X"43", X"44", X"C4", X"DE", X"E9", X"CB",
    X"54", X"7B", X"94", X"32", X"A6", X"C2", X"23", X"3D", X"EE", X"4C", X"95", X"0B", X"42", X"FA", X"C3", X"4E",
    X"08", X"2E", X"A1", X"66", X"28", X"D9", X"24", X"B2", X"76", X"5B", X"A2", X"49", X"6D", X"8B", X"D1", X"25",
    X"72", X"F8", X"F6", X"64", X"86", X"68", X"98", X"16", X"D4", X"A4", X"5C", X"CC", X"5D", X"65", X"B6", X"92",
    X"6C", X"70", X"48", X"50", X"FD", X"ED", X"B9", X"DA", X"5E", X"15", X"46", X"57", X"A7", X"8D", X"9D", X"84",
    X"90", X"D8", X"AB", X"00", X"8C", X"BC", X"D3", X"0A", X"F7", X"E4", X"58", X"05", X"B8", X"B3", X"45", X"06",
    X"D0", X"2C", X"1E", X"8F", X"CA", X"3F", X"0F", X"02", X"C1", X"AF", X"BD", X"03", X"01", X"13", X"8A", X"6B",
    X"3A", X"91", X"11", X"41", X"4F", X"67", X"DC", X"EA", X"97", X"F2", X"CF", X"CE", X"F0", X"B4", X"E6", X"73",
    X"96", X"AC", X"74", X"22", X"E7", X"AD", X"35", X"85", X"E2", X"F9", X"37", X"E8", X"1C", X"75", X"DF", X"6E",
    X"47", X"F1", X"1A", X"71", X"1D", X"29", X"C5", X"89", X"6F", X"B7", X"62", X"0E", X"AA", X"18", X"BE", X"1B",
    X"FC", X"56", X"3E", X"4B", X"C6", X"D2", X"79", X"20", X"9A", X"DB", X"C0", X"FE", X"78", X"CD", X"5A", X"F4",
    X"1F", X"DD", X"A8", X"33", X"88", X"07", X"C7", X"31", X"B1", X"12", X"10", X"59", X"27", X"80", X"EC", X"5F",
    X"60", X"51", X"7F", X"A9", X"19", X"B5", X"4A", X"0D", X"2D", X"E5", X"7A", X"9F", X"93", X"C9", X"9C", X"EF",
    X"A0", X"E0", X"3B", X"4D", X"AE", X"2A", X"F5", X"B0", X"C8", X"EB", X"BB", X"3C", X"83", X"53", X"99", X"61",
    X"17", X"2B", X"04", X"7E", X"BA", X"77", X"D6", X"26", X"E1", X"69", X"14", X"63", X"55", X"21", X"0C", X"7D");
signal I: integer;
type t1 is array (0 to 15) of std_logic_vector(0 to 7);
signal t: t1;
signal k: inte;
begin
process (a)
begin
for I in 0 to 15 loop
t(I)<=a((8*I) to ((8*(I+1))-1));
end loop;
end process;
process (t)
begin
for I in 0 to 15 loop
k(I)<=to_integer ( unsigned (t(I)));
end loop;
end process;
process (k)
begin
for I in 0 to 15 loop
b((8*I) to ((8*(I+1))-1))<=matt(k(I));
end loop;
end process;
end Behavioral;
