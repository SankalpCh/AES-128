----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.03.2018 21:43:55
-- Design Name: 
-- Module Name: addroundkey - Behavioral
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

entity addroundkey is
    Port ( a : in STD_LOGIC_VECTOR (0 to 127);
           b : in STD_LOGIC_VECTOR (0 to 127);
           c : out STD_LOGIC_VECTOR (0 to 127));
end addroundkey;

architecture Behavioral of addroundkey is
begin
c<= a xor b;
end Behavioral;
