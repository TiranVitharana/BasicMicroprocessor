----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2024 02:36:02 AM
-- Design Name: 
-- Module Name: TB_Instruction_Decoder - Behavioral
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

entity TB_Instruction_Decoder is
--  Port ( );
end TB_Instruction_Decoder;

architecture Behavioral of TB_Instruction_Decoder is

component Instruction_Decoder is
    Port ( RegCheckforJmp : in STD_LOGIC_VECTOR (3 downto 0);--
     LoadSelect : out STD_LOGIC_VECTOR (1 downto 0);
     InstructionBus : in STD_LOGIC_VECTOR (12 downto 0);--
     RegisterEnable : out STD_LOGIC_VECTOR (2 downto 0);--
     ImmediateValue : out STD_LOGIC_VECTOR (3 downto 0);--
     Add_SubSelection : out STD_LOGIC;
     RegisterSelect : out STD_LOGIC_VECTOR (2 downto 0);--
     RegisterSelect2 : out STD_LOGIC_VECTOR (2 downto 0);--
     JumpFlag : out STD_LOGIC;
     RCAEN:OUT STD_LOGIC;
     CompEN:OUT STD_LOGIC;
     JumpAddress : out STD_LOGIC_VECTOR (2 downto 0)--
     );
end component;

signal InstructionBus : STD_LOGIC_VECTOR (12 downto 0);
signal RegCheckforJmp,ImmediateValue : STD_LOGIC_VECTOR(3 downto 0);
signal RegisterEnable,RegisterSelect,RegisterSelect2,JumpAddress : STD_LOGIC_VECTOR(2 downto 0);
signal LoadSelect : STD_LOGIC_VECTOR(1 downto 0);
signal Add_SubSelection,JumpFlag,RCAEN, CompEN : STD_LOGIC;

begin

UUT : Instruction_Decoder port map (
    InstructionBus => InstructionBus,
    RegCheckforJmp => RegCheckforJmp,
    RegisterEnable => RegisterEnable,
    LoadSelect => LoadSelect,
    ImmediateValue => ImmediateValue ,
    RegisterSelect => RegisterSelect ,
    RegisterSelect2 => RegisterSelect2 ,
    Add_SubSelection => Add_SubSelection,
    JumpFlag => JumpFlag,
    RCAEN => RCAEN,
    JumpAddress => JumpAddress,
    CompEN => CompEN);

process 
begin
    --1
    InstructionBus <=  "0101100000010";
    RegCheckforJmp <= "0000";
    wait for 100ns;
    
    --2 
    InstructionBus <=  "0001100110000";
    wait for 100ns;
    
    --3
    InstructionBus <=  "0011000000000";
    wait for 100ns;
    
    --4
    InstructionBus <= "0111100000111";
    wait for 100ns;

    --5
    InstructionBus <= "1001100100000";
    wait for 100ns;
    
    wait;

end process;
end Behavioral;
