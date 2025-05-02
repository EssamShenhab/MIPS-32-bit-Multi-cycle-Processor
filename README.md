# MIPS-32-bit-Multi-cycle-Processor

---

=======
>>>>>>> Ali

---

=======
>>>>>>> Essam

🔸 **1. ALU.vhd - Arithmetic Logic Unit**

This module performs arithmetic and logical operations required by the processor.  
✅ **Features:**

- Supports operations: AND, OR, ADD, SUB, SLT, NOR.
- Produces a zero flag used for branching decisions.

📥 **Inputs:**

- A: First operand (32-bit).
- B: Second operand (32-bit).
- ALUControl: Control signal determining the operation (4-bit).

📤 **Outputs:**

- ALUResult: Result of the operation (32-bit).
- Zero: Flag indicating if ALUResult is zero.

---

🔸 **2. ALUControl.vhd - ALU Control Unit**

This module decodes the function field of the instruction and the ALUOp to generate the ALU control signal.  
✅ **Features:**

- Supports R-type and I-type instruction decoding.
- Works in conjunction with the main Control Unit and ALU.

📥 **Inputs:**

- ALUOp: ALU operation type from Control Unit (2-bit).
- Funct: Function field from instruction (6-bit).

📤 **Output:**

- ALUControl: Specific control signal for the ALU (4-bit).

---

🔸 **3. Mux2_5bit.vhd - 2-Input MUX (5-bit)**

This multiplexer selects between two 5-bit inputs.  
✅ **Features:**

- Used for selecting register destination (e.g., rt or rd).

📥 **Inputs:**

- Input0: First input (5-bit).
- Input1: Second input (5-bit).
- Sel: Select signal.

📤 **Output:**

- Output: Selected value (5-bit).

---

🔸 **4. Mux2_32bit.vhd - 2-Input MUX (32-bit)**

This multiplexer selects between two 32-bit inputs.  
✅ **Features:**

- Commonly used for selecting between ALU result and memory data.

📥 **Inputs:**

- Input0: First input (32-bit).
- Input1: Second input (32-bit).
- Sel: Select signal.

📤 **Output:**

- Output: Selected value (32-bit).

---

🔸 **5. Mux3_32bit.vhd - 3-Input MUX (32-bit)**

This module selects between three 32-bit inputs.  
✅ **Features:**

- Useful for selecting next PC value from PC+4, branch address, or jump address.

📥 **Inputs:**

- Input0: First input (32-bit).
- Input1: Second input (32-bit).
- Input2: Third input (32-bit).
- Sel: 2-bit select signal.

📤 **Output:**

- Output: Selected value (32-bit).

---

🔸 **6. Mux4_32bit.vhd - 4-Input MUX (32-bit)**

This multiplexer selects between four 32-bit inputs.  
✅ **Features:**

- Used when multiple sources are candidates for the same data line.

📥 **Inputs:**

- Input0: First input (32-bit).
- Input1: Second input (32-bit).
- Input2: Third input (32-bit).
- Input3: Fourth input (32-bit).
- Sel: 2-bit select signal.

📤 **Output:**

- Output: Selected value (32-bit).

---


=======
>>>>>>> Merna


---

=======
>>>>>>> Omar

---

## 🗂 File Structure

```bash
.
├── Memory.vhd       # Main memory (instruction/data memory)
├── MDR.vhd          # Memory Data Register
├── Registers.vhd    # Register File (32 general-purpose registers)
└── README.md        # Project documentation

---