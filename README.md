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


## Shift_Left26To28 
It is moving all bits in a binary value to the left by 2  (jump instructions)

#### input :
 SL_in : It is 26-bit address 
 
#### output	:
 SL_out : It is the shifted value after performing the shift-left operation


## Shift_Left32To32
It is moving all bits in a binary value to the left by 2 (multiplying the value by 4)
	
#### input : 
SL_in : It is 32-bit from sign-extented

#### output	:
SL_out : It is the shifted value after performing the shift-left operation



÷ف
÷لإ ه





