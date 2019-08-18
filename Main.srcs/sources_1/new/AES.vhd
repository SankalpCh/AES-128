----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2018 10:04:01
-- Design Name: 
-- Module Name: AES - Behavioral
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

entity AES is
    Port ( x : in STD_LOGIC_VECTOR (0 to 127);
           key1 : in STD_LOGIC_VECTOR (0 to 127);
           y : out STD_LOGIC_VECTOR (0 to 127));
end AES;

architecture Behavioral of AES is
component cntrlr_enc is
    Port ( a : in STD_LOGIC_VECTOR (0 to 127);
           key : in STD_LOGIC_VECTOR (0 to 127);
           b : out STD_LOGIC_VECTOR (0 to 127));
end component;
component cntrlr_dec is
    Port ( a : in STD_LOGIC_VECTOR (0 to 127);
           key : in STD_LOGIC_VECTOR (0 to 127);
           b : out STD_LOGIC_VECTOR (0 to 127));
end component;
signal x1, k1, y1: std_logic_vector (0 to 127);
begin
x1<= x;
k1<= key1;
u1: cntrlr_enc port map ( a => x1, key => k1, b => y1);
u2: cntrlr_dec port map ( a => y1, key => k1, b => y);
end Behavioral;
