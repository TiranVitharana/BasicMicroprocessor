----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 04:58:06 PM
-- Design Name: 
-- Module Name: NanoProcessor - Behavioral
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

entity NanoProcessor is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC:='0';
           Reg7_Seg : out STD_LOGIC_VECTOR (6 downto 0);
           Zero : out STD_LOGIC;
           Overflow : out STD_LOGIC;
           Anode : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_7_Out : out STD_LOGIC_VECTOR (3 downto 0)); 
end NanoProcessor;

architecture Behavioral of NanoProcessor is

component Slow_clk port (
    Clk_in : in STD_LOGIC;
    Clk_out : out STD_LOGIC);
end component;

component Register_Bank port(
    Clk : in STD_LOGIC; 
    Reg_En : in STD_LOGIC_VECTOR (2 downto 0);
    D : in STD_LOGIC_VECTOR (3 downto 0);
    S_out_0 : out STD_LOGIC_VECTOR (3 downto 0);
    S_out_1 : out STD_LOGIC_VECTOR (3 downto 0);
    S_out_2 : out STD_LOGIC_VECTOR (3 downto 0);
    S_out_3 : out STD_LOGIC_VECTOR (3 downto 0);
    S_out_4 : out STD_LOGIC_VECTOR (3 downto 0);
    S_out_5 : out STD_LOGIC_VECTOR (3 downto 0);
    S_out_6 : out STD_LOGIC_VECTOR (3 downto 0);
    S_out_7 : out STD_LOGIC_VECTOR (3 downto 0);
    reset : in std_logic:='0'
);
end component;

component Adder_Subtractor_4bit
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0); --input A
           B : in STD_LOGIC_VECTOR (3 downto 0); --input B
           M : in STD_LOGIC;                     -- Adder Subtractor switch
           S : out STD_LOGIC_VECTOR (3 downto 0);--Output
           C_OUT : out STD_LOGIC;                --Carry or Borrow out
           OVERFLOW: out STD_LOGIC;              --Overflow Flag
           ZERO: out STD_LOGIC                   --Zero Flag
           );                
end component;

component Program_Counter
    Port ( Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (2 downto 0);
           memory_select : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component adder_3_bit is
    Port ( A : in STD_LOGIC_Vector(2 downto 0);
           S : out STD_LOGIC_vector(2 downto 0));
end component;

component MUX_8_to_1
 Port ( 
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

component Instruction_Decoder
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
end component;

component MUX_2_to_1_3bit
     Port ( 
     J : in STD_LOGIC_VECTOR (2 downto 0);
     A : in STD_LOGIC_VECTOR (2 downto 0);
     JmpF : in STD_LOGIC;
     S_out : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component MUX_4_to_1_4bit 
Port (  A : in STD_LOGIC_VECTOR (3 downto 0);
        I : in STD_LOGIC_VECTOR (3 downto 0);
        M : in STD_LOGIC_VECTOR (3 downto 0);
        LoadSel : in STD_LOGIC_VECTOR (1 downto 0);
        S_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component ROM
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (12 downto 0));
end component;

component LUT_16_7 is
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component Comparator
    Port ( input1 : in STD_LOGIC_VECTOR(3 downto 0);
           input2 : in STD_LOGIC_VECTOR(3 downto 0);
           output : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Reg_En, Count_In, Address, Next_Address, RegSel, RegisterEnable, JumpAddress, RegisterSelect2: STD_LOGIC_VECTOR (2 downto 0);
signal RegOut_0, RegOut_1, RegOut_2,RegOut_3,RegOut_4,RegOut_5,RegOut_6,RegOut_7, D, First_Number, Second_Number, Output_Number, Comp_Out, ImmediateValue, input1, input2 : STD_LOGIC_VECTOR (3 downto 0);
signal InstructionBus: STD_LOGIC_VECTOR (12 downto 0);
signal Reg7_Seg_temp: STD_LOGIC_VECTOR (6 downto 0);
signal Reg_Reset, Mode, Overflow_Temp, Carry_Out, Zero_Out, PC_Reset, JumpFlag, RCAEN, CompEN, SlowedClock : STD_LOGIC;
signal  LoadSelect : STD_LOGIC_VECTOR (1 downto 0);


begin
    Anode <= "1110";
    RegisterBank: Register_Bank port map(
        Clk => SlowedClock, 
        Reg_En => RegisterEnable,
        D => D,
        S_out_0 => RegOut_0,
        S_out_1 => RegOut_1,
        S_out_2 => RegOut_2,
        S_out_3 => RegOut_3,
        S_out_4 => RegOut_4,
        S_out_5 => RegOut_5,
        S_out_6 => RegOut_6,
        S_out_7 => RegOut_7,
        reset => Reset
    );
    
    AdderSubtractor : Adder_Subtractor_4bit Port map ( 
        A => First_Number,
        B => Second_Number,
        M => Mode,                     
        S => Output_Number,
        C_OUT => Carry_Out,             
        OVERFLOW=> Overflow,           
        ZERO=> Zero             
    );
    
    
    ProgramCounter: Program_Counter Port map( 
        Reset => Reset,
        Clk => SlowedClock,
        D => Count_In,
        memory_select => Address
    );
    
    
    Bit3_Adder: adder_3_bit Port map ( 
        A => Address,
        S => Next_Address
    );
    
     MUX_8_to_1_one: MUX_8_to_1 Port Map( 
         R0 => RegOut_0,
         R1 => RegOut_1,
         R2 => RegOut_2,
         R3 => RegOut_3,
         R4 => RegOut_4,
         R5 => RegOut_5,
         R6 => RegOut_6,
         R7 => RegOut_7,
         RegSel => RegisterSelect2,
         Y => Second_Number
     );
     
     MUX_8_to_1_two: MUX_8_to_1 Port Map( -- connected to B , so neggate
        R0 => RegOut_0,
        R1 => RegOut_1,
        R2 => RegOut_2,
        R3 => RegOut_3,
        R4 => RegOut_4,
        R5 => RegOut_5,
        R6 => RegOut_6,
        R7 => RegOut_7,
        RegSel => RegSel,
        Y => First_Number
    );
    
    InstructionDecoder : Instruction_Decoder
     Port map ( 
         InstructionBus => InstructionBus,--
         RegCheckforJmp => First_Number,--
         RegisterEnable => RegisterEnable,--
         LoadSelect => LoadSelect,
         ImmediateValue => ImmediateValue,--
         RegisterSelect => RegSel,--
         Add_SubSelection =>  Mode,
         JumpFlag => JumpFlag,
         RCAEN => RCAEN,
         CompEN => CompEN,
         JumpAddress => JumpAddress,--
         RegisterSelect2 => RegisterSelect2
     );
    
    MUX_3bit : MUX_2_to_1_3bit
          Port Map ( 
        J => JumpAddress,
        A => Next_Address,
        JmpF => JumpFlag,
        S_out => Count_In
    );
    
    MUX_4bit : MUX_4_to_1_4bit 
    Port Map(
        A => Output_Number,
        I => ImmediateValue,
        M => Comp_Out  ,
        LoadSel => LoadSelect,
        S_out => D
    );

    RO_M : ROM
        Port Map ( 
        address => Address,
        data => InstructionBus
    );
    
    LUT: LUT_16_7
        Port Map( 
        address => RegOut_7,
        data => Reg7_Seg_temp);
        
    Comparator_0: Comparator
                Port Map(    
                input1 => First_Number,
                input2 => Second_Number,
                output => Comp_Out);
        
    SlowClk: Slow_clk port Map (
            Clk_in => Clk ,
            Clk_out => SlowedClock);
    
    Reg7_Seg <= Reg7_Seg_temp;
    Reg_7_Out <= RegOut_7;


end Behavioral;
