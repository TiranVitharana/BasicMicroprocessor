----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 11:00:28 AM
-- Design Name: 
-- Module Name: ROM - Behavioral
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
use ieee.numeric_std.all; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (12 downto 0));
end ROM;

architecture Behavioral of ROM is
type rom_type is array (0 to 7) of std_logic_vector(12 downto 0);
 
    signal program_ROM : rom_type := (
    
--                "0101110000010",  --MOVI R7,2
--                "0100010000001", --MOVI R1,1
--                "1001110010000", --CMP R7,R1        --Second test case with comp
--                "1001110010000", --CMP R7,R1 
--                "0100100000100", --MOVI R2,4
--                "1001110100010", --CMP R7,R2
--                "0011110000000",  --NEG R7
--                "0001110010000"  --ADD R7, R1
             
                   
                "0101110000001",--0 MOVI R7,01              --This is the basic code
                "0100100000010",--1 MOVI R2,02
                "0100110000011",--2 MOVI R3,03
                "0001110100000",--3 ADD R7,R2
                "0001110110000",--4 ADD R7,R3
                "0110000000101",--5 JZR R0,5
                "0000000000000",--6  ---- 
                "0000000000000" --7 ----
        
    );
begin
data <= program_ROM(to_integer(unsigned(address)));
end Behavioral;
