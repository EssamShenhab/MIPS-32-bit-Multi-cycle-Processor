# Multi-Cycle Processor - Memory Modules

This project includes two essential modules for a multi-cycle processor architecture: the **Memory** and the **Memory Data Register (MDR)**. These components work together to handle memory read/write operations and temporarily store the data during instruction execution.

---

## 🧠 Overview

### 🔸 1. `Memory.vhd`

This module represents the **main memory** of the processor, where both instructions and data are stored. It supports reading and writing 32-bit data aligned to byte-addressable memory.

#### ✅ Features:

- Memory is modeled as an array of 8-bit vectors (`std_logic_vector(7 downto 0)`).
- Read and write are done in 4 consecutive bytes to support 32-bit data.
- Memory size is 56 bytes.
- Preloaded with some test instructions (e.g., `lw`, `addi`, `add`, `beq`, `j`).

#### 📥 Inputs:

- `Clock`: System clock.
- `Address`: Address for read/write operation.
- `MemWrite`: Enables memory write when `'1'`.
- `MemRead`: Enables memory read when `'1'`.
- `WriteData`: 32-bit data to be written into memory.

#### 📤 Output:

- `MemData`: 32-bit data output read from memory.

---

### 🔸 2. `MDR.vhd` (Memory Data Register)

This module acts as a **temporary register** to hold data read from or written to memory. It's used in multi-cycle processors to isolate memory operations.

#### ✅ Features:

- Stores 32-bit data on rising edge of clock.
- Outputs the stored data continuously.
- Useful for separating memory access and data usage in later stages.

#### 📥 Input:

- `Clock`: System clock.
- `Data_In`: 32-bit input data (from memory or ALU).

#### 📤 Output:

- `Data_Out`: 32-bit stored data.

---

## 🗂 File Structure

```bash
.
├── Memory.vhd      # Memory module
├── MDR.vhd         # Memory Data Register
└── README.md       # Project documentation
