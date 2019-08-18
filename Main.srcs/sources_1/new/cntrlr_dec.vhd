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
-- 
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

entity cntrlr_dec is
    Port ( a : in STD_LOGIC_VECTOR (0 to 127);
           key : in STD_LOGIC_VECTOR (0 to 127);
           b : out STD_LOGIC_VECTOR (0 to 127));
end cntrlr_dec;

architecture Behavioral of cntrlr_dec is

component inversesubbytes is
    Port ( a : in STD_LOGIC_VECTOR (0 to 127);
          b : out STD_LOGIC_VECTOR (0 to 127));
end component;
component inverseshift is
    Port (
     a : in std_logic_vector (0 to 127);
     b : out std_logic_vector (0 to 127));
end component;
component addroundkey is
    Port ( a : in STD_LOGIC_VECTOR (0 to 127);
           b : in STD_LOGIC_VECTOR (0 to 127);
           c : out STD_LOGIC_VECTOR (0 to 127));
end component;
component inversemixcolumns is
    Port ( a : in STD_LOGIC_VECTOR (0 to 127);
           b : out STD_LOGIC_VECTOR (0 to 127));
end component;
component roundkygn is
    Port ( x : in STD_LOGIC_VECTOR (0 to 127);
            y: out arr);
end component;

signal t: st;
signal x, key1: STD_LOGIC_VECTOR (0 to 127);
signal k: arr;

begin
x<=a;
key1<=key;
p0: roundkygn port map ( x => key1, y => k);
u0: addroundkey port map ( a => x, b => k(10) , c => t(0));
x1: inverseshift port map ( a => t(0), b => t(1));
y1: inversesubbytes port map ( a => t(1), b => t(2));
z1: addroundkey port map ( a => t(2), b => k(9) , c => t(3));
w2: inversemixcolumns port map ( a => t(3), b => t(4));
x2: inverseshift port map ( a => t(4), b => t(5));
y2: inversesubbytes port map ( a => t(5), b => t(6));
z2: addroundkey port map ( a => t(6), b => k(8) , c => t(7));
w3: inversemixcolumns port map ( a => t(7), b => t(8));
x3: inverseshift port map ( a => t(8), b => t(9));
y3: inversesubbytes port map ( a => t(9), b => t(10));
z3: addroundkey port map ( a => t(10), b => k(7) , c => t(11));
w4: inversemixcolumns port map ( a => t(11), b => t(12));
x4: inverseshift port map ( a => t(12), b => t(13));
y4: inversesubbytes port map ( a => t(13), b => t(14));
z4: addroundkey port map ( a => t(14), b => k(6) , c => t(15));
w5: inversemixcolumns port map ( a => t(15), b => t(16));
x5: inverseshift port map ( a => t(16), b => t(17));
y5: inversesubbytes port map ( a => t(17), b => t(18));
z5: addroundkey port map ( a => t(18), b => k(5) , c => t(19));
w6: inversemixcolumns port map ( a => t(19), b => t(20));
x6: inverseshift port map ( a => t(20), b => t(21));
y6: inversesubbytes port map ( a => t(21), b => t(22));
z6: addroundkey port map ( a => t(22), b => k(4) , c => t(23));
w7: inversemixcolumns port map ( a => t(23), b => t(24));
x7: inverseshift port map ( a => t(24), b => t(25));
y7: inversesubbytes port map ( a => t(25), b => t(26));
z7: addroundkey port map ( a => t(26), b => k(3) , c => t(27));
w8: inversemixcolumns port map ( a => t(27), b => t(28));
x8: inverseshift port map ( a => t(28), b => t(29));
y8: inversesubbytes port map ( a => t(29), b => t(30));
z8: addroundkey port map ( a => t(30), b => k(2) , c => t(31));
w9: inversemixcolumns port map ( a => t(31), b => t(32));
x9: inverseshift port map ( a => t(32), b => t(33));
y9: inversesubbytes port map ( a => t(33), b => t(34));
z9: addroundkey port map ( a => t(34), b => k(1) , c => t(35));
w10: inversemixcolumns port map ( a => t(35), b => t(36));
x10: inverseshift port map ( a => t(36), b => t(37));
y10: inversesubbytes port map ( a => t(37), b => t(38));
z10: addroundkey port map ( a => t(38), b => key1 , c => t(39));
b<=t(39);
end Behavioral;
