----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2024 02:53:11 PM
-- Design Name: 
-- Module Name: Comparator - Behavioral
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

entity Comparator is
    Port ( input1 : in STD_LOGIC_VECTOR(3 downto 0);
           input2 : in STD_LOGIC_VECTOR(3 downto 0);
           output : out STD_LOGIC_VECTOR (3 downto 0)
          );
end Comparator;

architecture Behavioral of Comparator is

begin

process(input1, input2)
    begin
            if input1 > input2 then
                output <= "0001";  -- input1 > input2
            elsif input1 < input2 then
                output <= "0010";  -- input1 < input2
            else
                output <= "0011";  -- input1 = input2
            end if;
    end process;

end Behavioral;
