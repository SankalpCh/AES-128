----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2018 21:18:53
-- Design Name: 
-- Module Name: cntrlr_enc - Behavioral
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
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.arq.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cntrlr_enc is
    Port ( a : in STD_LOGIC_VECTOR (0 to 127);
           key : in STD_LOGIC_VECTOR (0 to 127);
           b : out STD_LOGIC_VECTOR (0 to 127));
end cntrlr_enc;

architecture Behavioral of cntrlr_enc is

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


signal t: st;
signal x, key1: STD_LOGIC_VECTOR (0 to 127);
signal k : arr;
--signal q: std_logic := '0';
begin
x<=a;
key1<=key;
p0: roundkygn port map ( x => key1, y => k );
u0: addroundkey port map ( a => x, b => key1 , c => t(0));
w1: subtrans port map ( a => t(0), b => t(1));
x1: shiftrows port map ( a => t(1), b => t(2));
y1: mixcolumns port map ( a => t(2), b => t(3));
z1: addroundkey port map ( a => t(3), b => k(1) , c => t(4));
w2: subtrans port map ( a => t(4), b => t(5));
x2: shiftrows port map ( a => t(5), b => t(6));
y2: mixcolumns port map ( a => t(6), b => t(7));
z2: addroundkey port map ( a => t(7), b => k(2) , c => t(8));
w3: subtrans port map ( a => t(8), b => t(9));
x3: shiftrows port map ( a => t(9), b => t(10));
y3: mixcolumns port map ( a => t(10), b => t(11));
z3: addroundkey port map ( a => t(11), b => k(3) , c => t(12));
w4: subtrans port map ( a => t(12), b => t(13));
x4: shiftrows port map ( a => t(13), b => t(14));
y4: mixcolumns port map ( a => t(14), b => t(15));
z4: addroundkey port map ( a => t(15), b => k(4) , c => t(16));
w5: subtrans port map ( a => t(16), b => t(17));
x5: shiftrows port map ( a => t(17), b => t(18));
y5: mixcolumns port map ( a => t(18), b => t(19));
z5: addroundkey port map ( a => t(19), b => k(5) , c => t(20));
w6: subtrans port map ( a => t(20), b => t(21));
x6: shiftrows port map ( a => t(21), b => t(22));
y6: mixcolumns port map ( a => t(22), b => t(23));
z6: addroundkey port map ( a => t(23), b => k(6) , c => t(24));
w7: subtrans port map ( a => t(24), b => t(25));
x7: shiftrows port map ( a => t(25), b => t(26));
y7: mixcolumns port map ( a => t(26), b => t(27));
z7: addroundkey port map ( a => t(27), b => k(7) , c => t(28));
w8: subtrans port map ( a => t(28), b => t(29));
x8: shiftrows port map ( a => t(29), b => t(30));
y8: mixcolumns port map ( a => t(30), b => t(31));
z8: addroundkey port map ( a => t(31), b => k(8) , c => t(32));
w9: subtrans port map ( a => t(32), b => t(33));
x9: shiftrows port map ( a => t(33), b => t(34));
y9: mixcolumns port map ( a => t(34), b => t(35));
z9: addroundkey port map ( a => t(35), b => k(9) , c => t(36));
w10: subtrans port map ( a => t(36), b => t(37));
x10: shiftrows port map ( a => t(37), b => t(38));
z10: addroundkey port map ( a => t(38), b => k(10) , c => t(39));
b<=t(39);
end Behavioral;