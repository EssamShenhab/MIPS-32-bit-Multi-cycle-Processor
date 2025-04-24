# Multi-Cycle Processor - Memory & Register Modules

This project contains essential components used in a **multi-cycle MIPS-like processor** architecture. The modules simulate memory access, temporary data storage, and register file functionality.

---

=======
>>>>>>> Ali

## 🧠 Overview

### 🔸 1. `Memory.vhd` - Main Memory

This module simulates the **byte-addressable memory** used for instruction and data storage.

#### ✅ Features:

- 56 bytes of memory, each cell is 8 bits (`std_logic_vector(7 downto 0)`).
- Supports aligned 32-bit reads and writes (4 consecutive bytes).
- Preloaded with MIPS-like instructions for testing (e.g., `lw`, `addi`, `add`, `beq`, `j`).

#### 📥 Inputs:

- `Clock`: Clock signal.
- `Address`: Address to read/write from (32-bit).
- `MemWrite`: Write enable signal.
- `MemRead`: Read enable signal.
- `WriteData`: Data to write into memory (32-bit).

#### 📤 Output:

- `MemData`: Data read from memory (32-bit).

---

### 🔸 2. `MDR.vhd` - Memory Data Register

Temporary register that **stores memory read data** before passing it to later stages in the datapath.

#### ✅ Features:

- Stores 32-bit data at rising edge of the clock.
- Simple and synchronous with 1-register depth.

#### 📥 Input:

- `Clock`: System clock.
- `Data_In`: 32-bit input data.

#### 📤 Output:

- `Data_Out`: Output of stored 32-bit data.

---

### 🔸 3. `Registers.vhd` - Register File

Implements the 32 general-purpose registers used in the processor. Allows simultaneous reading from two registers and writing to one register on clock edge.

#### ✅ Features:

- 32 registers (R0 to R31), each 32 bits wide.
- Supports **two asynchronous reads** and **one synchronous write**.
- Write is ignored if `write_reg = "00000"` (to preserve `$zero` register).

#### 📥 Inputs:

- `clk`: Clock signal.
- `reg_write`: Write enable signal.
- `read_reg1`, `read_reg2`: 5-bit register addresses for reading.
- `write_reg`: 5-bit register address to write to.
- `write_data`: Data to write into the register.

#### 📤 Outputs:

- `read_data1`, `read_data2`: Data outputs from the two read registers.

---

## 🗂 File Structure

```bash
.
├── Memory.vhd       # Main memory (instruction/data memory)
├── MDR.vhd          # Memory Data Register
├── Registers.vhd    # Register File (32 general-purpose registers)
└── README.md        # Project documentation

---

=======
>>>>>>> Essam


---

=======
>>>>>>> Merna


---

=======
>>>>>>> Omar
