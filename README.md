# MIPS-32-bit-Multi-cycle-Processor

## IR(Instruction_Register)
Instruction_Register Stores the instruction fetched from memory for the processor to parse and execute

#### input :
<p> IR_in : The instruction fetched from memory </p>
<p> IRWrite : allows the IR to be updated when high </p>
<p> clk : updates the IR on the rising edge </p>
<p> reset : clears the IR when activated </p>

#### output :
IR_out :  The current instruction held in the IR


## PC(Program Counter)
PC Store the address of the next instruction to be executed

#### input :
<p> PC_in :The new value to be loaded into the PC  </p>  
<p> PCWrite :  allows the PC to update only when it's high </p>
<p> clk : updates the PC value on the rising edge   </p>
<p> reset : resets the PC to zero or an initial value when activated </p>

#### output :
PC_out : The current value of the PC





