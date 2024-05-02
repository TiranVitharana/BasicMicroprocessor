----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 12:16:06 PM
-- Design Name: 
-- Module Name: TB_MUX_8_to_1 - Behavioral
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

entity TB_MUX_8_to_1 is
--  Port ( );
end TB_MUX_8_to_1;

architecture Behavioral of TB_MUX_8_to_1 is
component MUX_8_to_1 port(
        R0 : in STD_LOGIC_VECTOR (3 downto 0);
        R1 : in STD_LOGIC_VECTOR (3 downto 0);
        R2 : in STD_LOGIC_VECTOR (3 downto 0);
        R3 : in STD_LOGIC_VECTOR (3 downto 0);
        R4 : in STD_LOGIC_VECTOR (3 downto 0);
        R5 : in STD_LOGIC_VECTOR (3 downto 0);
        R6 : in STD_LOGIC_VECTOR (3 downto 0);
        R7 : in STD_LOGIC_VECTOR (3 downto 0);
        RegSel : in STD_LOGIC_VECTOR (2 downto 0);
        Y : out STD_LOGIC_VECTOR (3 downto 0));

end component;

signal R0,R1,R2,R3,R4,R5,R6,R7,Y : std_logic_vector(3 downto 0);
signal RegSel : std_logic_vector(2 downto 0);

begin
UUT : MUX_8_to_1 Port map(
           R0 => R0,
           R1 => R1,
           R2 => R2,
           R3 => R3,
           R4 => R4,
           R5 => R5,
           R6 => R6,
           R7 => R7,
           RegSel => RegSel,
           Y => Y
           );
process

begin
        R0 <= "0110";
        R1 <= "0001";
        R2 <= "1110";
        R3 <= "1001";
        R4 <= "1100";
        R5 <= "1011";
        R6 <= "1111";
        R7 <= "1101";
        
        RegSel <= "000";
        wait for 100ns;
        
        RegSel <= "001";
        wait for 100ns;
        
        RegSel <= "010";
        wait for 100ns;
        
        RegSel <= "011";
        wait for 100ns;
        
        RegSel <= "100";
        wait for 100ns;
        
        RegSel <= "101";
        wait for 100ns;
        
        RegSel <= "110";
        wait for 100ns;
        
        RegSel <= "111";
        wait;
        
        end process;

end Behavioral;
