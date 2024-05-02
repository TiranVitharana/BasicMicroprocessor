----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.04.2024 14:30:26
-- Design Name: 
-- Module Name: TB_MUX_2_to_1_4_bit - Behavioral
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

entity TB_MUX_4_to_1_4bit is
--  Port ( );
end TB_MUX_4_to_1_4bit;

architecture Behavioral of TB_MUX_4_to_1_4bit is


component MUX_4_to_1_4bit Port(
          A : in STD_LOGIC_VECTOR (3 downto 0);
          I : in STD_LOGIC_VECTOR (3 downto 0);
          M : in STD_LOGIC_VECTOR (3 downto 0);
          LoadSel : in STD_LOGIC_VECTOR (1 downto 0);
          S_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

SIGNAL A,I,M : std_logic_vector(3 downto 0);
SIGNAL LoadSel : std_logic_vector(1 downto 0);
SIGNAL S_out : std_logic_vector(3 downto 0);

begin

UUT : MUX_4_to_1_4bit Port map(
           A => A,
           I => I,
           M => M,
           LoadSel => LoadSel,
           S_out => S_out
           );
           
process
begin

A <= "0110";
I <= "1001";
M <= "1100";

LoadSel <= "00";
wait for 100ns;

LoadSel <= "01";
wait for 100ns;

LoadSel <= "10";
wait for 100ns;

A <= "0001";
I <= "1100";
M <= "0000";

LoadSel <= "00";
wait for 100ns;

LoadSel <= "01";
wait for 100ns;

LoadSel <= "10";
wait for 100ns;
  
wait;


end process;


end Behavioral;
