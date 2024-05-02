----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
--
-- Create Date: 07/23/2022 04:30:58 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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
entity Instruction_Decoder is
 Port ( 
     RegCheckforJmp : in STD_LOGIC_VECTOR (3 downto 0);--
     LoadSelect : out STD_LOGIC_VECTOR (1 downto 0):="00";
     InstructionBus : in STD_LOGIC_VECTOR (12 downto 0);--
     RegisterEnable : out STD_LOGIC_VECTOR (2 downto 0);--
     ImmediateValue : out STD_LOGIC_VECTOR (3 downto 0);--
     Add_SubSelection : out STD_LOGIC;
     RegisterSelect : out STD_LOGIC_VECTOR (2 downto 0);--
     RegisterSelect2 : out STD_LOGIC_VECTOR (2 downto 0);--
     JumpFlag : out STD_LOGIC:='0';
     RCAEN:OUT STD_LOGIC:='0';
     CompEN:OUT STD_LOGIC:='0';
     JumpAddress : out STD_LOGIC_VECTOR (2 downto 0):="000"--
     );
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

begin

JumpFlag <= NOT(InstructionBus(12)) and (InstructionBus(11)) and (InstructionBus(10)) and not(RegCheckforJmp(0) or RegCheckforJmp(1) or RegCheckforJmp(2) or RegCheckforJmp(3));
case1:process(InstructionBus)
begin
case InstructionBus(12 downto 10) is
    when "010"=>
--        JumpFlag<='0';
        RegisterEnable<=InstructionBus( 9 downto 7);
        ImmediateValue<=InstructionBus( 3 downto 0);
        LoadSelect<="01";
    when "000"=>
--        JumpFlag<='0';
        CompEN <= '0';
        RegisterSelect<=InstructionBus(9 downto 7);
        RegisterSelect2<=InstructionBus(6 downto 4);
        Add_SubSelection<='0';
        RegisterEnable<=InstructionBus(9 downto 7);
        LoadSelect<="00";
        RCAEN<='1';
    when "001"=>
--        JumpFlag<='0';
        RegisterSelect2<=InstructionBus(9 downto 7);
        RegisterEnable<=InstructionBus(9 downto 7);
        RegisterSelect<="000";
        Add_SubSelection<='1';
        LoadSelect<="00";
 
    when "011"=>
        RegisterSelect2<=InstructionBus(9 downto 7);
        RegisterSelect<=InstructionBus(6 downto 4);
        
--        JumpFlag <= not(RegCheckforJmp(0) or RegCheckforJmp(1) or RegCheckforJmp(2) or RegCheckforJmp(3));
--        JumpFlag <= '0';
          JumpAddress<=InstructionBus(2 downto 0);

--        if (RegCheckforJmp="0000") then
--            JumpFlag<='1';
--        else
--            JumpFlag<='0';
--        end if;
    
    when "100"=>

        RCAEN <= '0';
        RegisterSelect<=InstructionBus(9 downto 7);
        RegisterSelect2<=InstructionBus(6 downto 4);
        RegisterEnable<=InstructionBus(9 downto 7);
        LoadSelect<="10";
        CompEN <= '1';
        
        
    when others=> null;
 
end case;
end process case1;
end Behavioral;
