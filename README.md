# MIPS-32-bit-Multi-cycle-Processor

---

=======
>>>>>>> Ali

---

=======
>>>>>>> Essam

---

=======
>>>>>>> Merna


---

=======
>>>>>>> Omar

## 🔸 IR (Instruction Register)

The Instruction Register stores the instruction fetched from memory for the processor to parse and execute.

#### 📥 Inputs:

* `IR_in`: The instruction fetched from memory.
* `IRWrite`: Allows the IR to be updated when high.
* `clk`: Updates the IR on the rising edge.
* `reset`: Clears the IR when activated.

#### 📤 Output:

* `IR_out`: The current instruction held in the IR.

---

## 🔸 PC (Program Counter)

The Program Counter stores the address of the next instruction to be executed.

#### 📥 Inputs:

* `PC_in`: The new value to be loaded into the PC.
* `PCWrite`: Allows the PC to update only when it's high.
* `clk`: Updates the PC value on the rising edge.
* `reset`: Resets the PC to zero or an initial value when activated.

#### 📤 Output:

* `PC_out`: The current value of the PC.

---

## 🔸 Shift\_Left26To28

This module shifts all bits in a binary value to the left by 2 (used for jump instructions).

#### 📥 Input:

* `SL_in`: A 26-bit address.

#### 📤 Output:

* `SL_out`: The shifted value after performing the shift-left operation.

---

## 🔸 Shift\_Left32To32

This module shifts all bits in a 32-bit value to the left by 2 (effectively multiplying the value by 4).

#### 📥 Input:

* `SL_in`: A 32-bit value from sign-extended.

#### 📤 Output:

* `SL_out`: The shifted value after performing the shift-left operation.

---

=======
