# MIPS-32-bit-Multi-cycle-Processor

## Instruction_Register
Instruction_Register Stores the instruction fetched from memory for the processor to parse and execute

#### input 
<p> IR_in : It is 32 bit input come from memory </p>
<p> IRWrite : It is 1 bit input come from control unit </p>
<p> clk :  Used to synchronize operations in digital circuits </p>
<p> reset : Used to reset output to zero </p>

#### output
IR_out :  It is 32 bit equal to the input IR_in


## PC(Program Counter)
PC Store the address of the next instruction to be executed

#### input 
<p> IR_in : It is 32 bit input come from memory </p>
<p> IRWrite : It is 1 bit input come from control unit </p>
<p> clk :  Used to synchronize operations in digital circuits </p>
<p> reset : Used to reset output to zero </p>

#### output
IR_out :  It is 32 bit equal to the input IR_in





