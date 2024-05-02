----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.04.2024 14:41:10
-- Design Name: 
-- Module Name: TB_MUX_2_to_1_3_bit - Behavioral
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

entity TB_MUX_2_to_1_3_bit is
--  Port ( );
end TB_MUX_2_to_1_3_bit;

architecture Behavioral of TB_MUX_2_to_1_3_bit is

component MUX_2_to_1_3_bit Port(
           J : in STD_LOGIC_VECTOR (2 downto 0);
           A : in STD_LOGIC_VECTOR (2 downto 0);
           JmpF : in STD_LOGIC;
           S_out : out STD_LOGIC_VECTOR (2 downto 0));
end component;

SIGNAL J,A,S_out : std_logic_vector(2 downto 0);
SIGNAL JmpF : std_logic;

begin

UUT : MUX_2_way_3_bit Port map(
           J => J,
           A => A,
           JmpF => JmpF,
           S_out => S_out
           );
           
process
begin

J <= "110";
A <= "010";
JmpF<= '0';
wait for 200ns;

J <= "100";
A <= "111";
JmpF<= '1';
wait for 200ns;

J <= "110";
A <= "011";
JmpF<= '1';
wait for 200ns;

J <= "000";
A <= "110";
JmpF<= '0';
wait for 200ns;
wait;


end process;


end Behavioral;
