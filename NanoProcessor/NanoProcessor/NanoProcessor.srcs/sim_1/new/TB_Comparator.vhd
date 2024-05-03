----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2024 03:00:40 PM
-- Design Name: 
-- Module Name: TB_Comparator - Behavioral
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

entity TB_Comparator is
--  Port ( );
end TB_Comparator;

architecture Behavioral of TB_Comparator is

component Comparator is
    Port ( input1 : in STD_LOGIC_VECTOR(3 downto 0);
           input2 : in STD_LOGIC_VECTOR(3 downto 0);
           output : out STD_LOGIC_VECTOR (3 downto 0));
           
end component ;

signal input1 , input2 : STD_LOGIC_VECTOR(3 downto 0);
signal output : STD_LOGIC_VECTOR(3 downto 0);


begin

UUT : Comparator port map(
    
    input1 => input1,
    input2 => input2,
    output => output
    );

process 
begin
    input1 <= "0110";
    input2 <= "0001";
    wait for 100ns;
    
   
    input1 <= "1001";
    input2 <= "1110";
    wait for 100ns;
    
 
    input1 <= "1100";
    input2 <= "1011";
    wait for 100ns;

        
    input1 <= "1110";
    input2 <= "1111";
    wait for 100ns;

        
    input1 <= "1110";
    input2 <= "1110";
    wait for 100ns;
    
    wait;
    
end process;

end Behavioral;
