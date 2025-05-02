library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ControlUnit is
    port (
        -- Inputs
        op           : in  std_logic_vector(5 downto 0);
        CLK          : in  std_logic;
        Reset        : in  std_logic;

        -- Outputs
        RegDst       : out std_logic;
        ALUSrcA      : out std_logic;
        ALUSrcB      : out std_logic;
        MemRead      : out std_logic;
        MemWrite     : out std_logic;
        MemtoReg     : out std_logic;
        RegWrite     : out std_logic;
        Branch       : out std_logic;
        Jump         : out std_logic;
        ALUOp        : out std_logic_vector(1 downto 0);
        PCWrite      : out std_logic;
        PCWriteCond  : out std_logic;
        IorD         : out std_logic;
        IRWrite      : out std_logic;
        PCSource     : out std_logic_vector(1 downto 0)
    );
end entity;

architecture rtl of ControlUnit is

    type state_type is (
        InstructionFetch,
        InstructionDecode,
        MemoryAddressComp,
        Execution,
        Execution_I,
        BranchCompletion,
        JumpCompletion,
        MemoryAccessLoad,
        MemoryAccessStore,
        RTypeCompletion,
        RTypeCompletion_I,
        MemoryReadCompletionStep
    );

    signal current_state, next_state : state_type;
    signal ctrl_state : std_logic_vector(15 downto 0) := (others => '0');

begin

    -- State Transition Logic
    process(CLK, Reset)
    begin
        if Reset = '0' then
            current_state <= InstructionFetch;
        elsif rising_edge(CLK) then
            current_state <= next_state;
        end if;
    end process;

    -- Next State Logic
    process(current_state, op)
    begin
        case current_state is
            when InstructionFetch =>
                next_state <= InstructionDecode;

            when InstructionDecode =>
                case op is
                    when "100011" => next_state <= MemoryAddressComp;  -- lw
                    when "101011" => next_state <= MemoryAddressComp;  -- sw
                    when "000000" => next_state <= Execution;          -- R-type
                    when "001000" => next_state <= Execution_I;        -- addi
                    when "000100" => next_state <= BranchCompletion;   -- beq
                    when "000010" => next_state <= JumpCompletion;     -- jump
                    when others   => next_state <= InstructionFetch;
                end case;

            when MemoryAddressComp =>
                if op = "100011" then
                    next_state <= MemoryAccessLoad;
                else
                    next_state <= MemoryAccessStore;
                end if;

            when Execution =>
                next_state <= RTypeCompletion;

            when Execution_I =>
                next_state <= RTypeCompletion_I;

            when MemoryAccessLoad =>
                next_state <= MemoryReadCompletionStep;

            when MemoryAccessStore | BranchCompletion | JumpCompletion | RTypeCompletion | RTypeCompletion_I | MemoryReadCompletionStep =>
                next_state <= InstructionFetch;

            when others =>
                next_state <= InstructionFetch;
        end case;
    end process;

    -- Control Signal Assignments for Each State
    with current_state select
        ctrl_state <=
            "1001001000001000" when InstructionFetch,
            "0000000000011000" when InstructionDecode,
            "0000000000010100" when MemoryAddressComp,
            "0000000001000100" when Execution,
            "0000000000010100" when Execution_I,
            "0100000010100100" when BranchCompletion,
            "1000000100000000" when JumpCompletion,
            "0011000000000000" when MemoryAccessLoad,
            "0010100000000000" when MemoryAccessStore,
            "0000000000000011" when RTypeCompletion,
            "0000000000000010" when RTypeCompletion_I,
            "0000010000000010" when MemoryReadCompletionStep,
            "0000000000000000" when others;

    -- Assign control bits to output ports
    PCWrite     <= ctrl_state(15);
    PCWriteCond <= ctrl_state(14);
    IorD        <= ctrl_state(13);
    MemRead     <= ctrl_state(12);
    MemWrite    <= ctrl_state(11);
    MemtoReg    <= ctrl_state(10);
    IRWrite     <= ctrl_state(9);
    PCSource    <= ctrl_state(8 downto 7);
    ALUOp       <= ctrl_state(6 downto 5);
    ALUSrcB     <= ctrl_state(4);
    ALUSrcA     <= ctrl_state(3);
    RegWrite    <= ctrl_state(2);
    Branch      <= ctrl_state(1);
    RegDst      <= ctrl_state(0);

end architecture;
