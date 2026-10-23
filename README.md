# x32 Assembly Language Lab Workbook — Companion Repository

**Author:** Asghar Ali Mughal, Isra University Hyderabad  
**Toolchain:** ASM Visual · MASM32 SDK · x32dbg (Windows x86 / 32-bit Protected Mode)  
**Repository:** [https://github.com/asghar-mughal/x32-Assembly-Workbook](https://github.com/asghar-mughal/x32-Assembly-Workbook)

---

## Overview

This repository contains all starter templates, reusable library header files (`.inc`), complete lab source programs (`.asm`), and pre-built reverse-engineering / bug-hunt binaries (`.exe`) for the 23-lab workbook ***x32 Assembly Language Lab Workbook***.

Every `.asm` program in this repository has been tested and verified against the **ASM Visual MASM32 toolchain** (`ml.exe` and `link.exe`).

---

## Repository Structure

```text
x32-Assembly-Workbook/
├── include/                  # Reusable macro & procedure libraries
│   ├── mylib.inc             # Macro library (Lab 17: say, showval, swapmem, maxof, abs_to)
│   ├── mylibp.inc            # Procedure library (Lab 17: print_array, strlen_p)
│   └── fpulib.inc            # x87 FPU helper procedure (Lab 21: print_fpu)
├── lab01/                    # Lab 01: Environment Setup & Your First x32 Assembly Program
│   ├── hello.asm
│   └── hello_add.asm
├── lab02/                    # Lab 02: Inside the x86 CPU — Registers, EFLAGS & x32dbg
│   ├── debug1.asm
│   ├── flags1.asm
│   └── bug1.asm
├── lab03/                    # Lab 03: Data Definitions, Memory Layout & Little-Endian Storage
│   ├── data1.asm
│   ├── data2.asm
│   └── data3.asm
├── lab04/                    # Lab 04: Integer Arithmetic — ADD, SUB, INC, DEC, NEG, MUL & DIV
│   ├── arith1.asm
│   ├── mul1.asm
│   ├── imul1.asm
│   ├── div1.asm
│   └── expr1.asm
├── lab05/                    # Lab 05: Addressing Modes, Data Transfer, MOVZX/MOVSX, XCHG & Ptr
│   ├── reg1.asm
│   ├── sizes1.asm
│   ├── ext1.asm
│   ├── ovf1.asm
│   ├── swap1.asm
│   └── str1.asm
├── lab06/                    # Lab 06: Console Input & Output with the MASM32 Library
│   ├── out1.asm
│   ├── in1.asm
│   ├── calc1.asm
│   └── calc2.asm
├── lab07/                    # Lab 07: Making Decisions — CMP, Unconditional & Conditional Jumps
│   ├── cmp1.asm
│   ├── jmp1.asm
│   ├── sign1.asm
│   ├── max2.asm
│   ├── parity1.asm
│   ├── grade1.asm
│   ├── signed1.asm
│   ├── range1.asm
│   └── safe1.asm
├── lab08/                    # Lab 08: Loops — LOOP, Counter Loops, Sentinel & Nested Loops
│   ├── sum1.asm
│   ├── bug1.asm
│   ├── hello5.asm
│   ├── count1.asm
│   ├── table1.asm
│   ├── sumn.asm
│   ├── fact1.asm
│   ├── tri1.asm
│   └── grid1.asm
├── lab09/                    # Lab 09: Bitwise Logic, Shifts & Rotates
│   ├── logic1.asm
│   ├── mask1.asm
│   ├── parity2.asm
│   ├── shift1.asm
│   ├── mul10.asm
│   ├── color1.asm
│   └── bin1.asm
├── lab10/                    # Lab 10: 1D Arrays, Indexed Addressing, Pointers & LEA
│   ├── arr1.asm
│   ├── print1.asm
│   ├── squares1.asm
│   ├── stats1.asm
│   ├── ptr1.asm
│   ├── lea1.asm
│   └── str2.asm
├── lab11/                    # Lab 11: Mid-Term Practical Assessment & Debugging Clinic
│   ├── template.asm
│   ├── secD_setA.asm
│   └── secD_setB.asm
├── lab12/                    # Lab 12: String Primitive Instructions & the Direction Flag
│   ├── strlen2.asm
│   ├── copy1.asm
│   ├── fill1.asm
│   ├── over1.asm
│   ├── cmp2.asm
│   ├── up2.asm
│   ├── vow1.asm
│   └── strlab.asm
├── lab13/                    # Lab 13: The Runtime Stack, PUSH/POP & Subroutines (CALL/RET)
│   ├── stack1.asm
│   ├── swap2.asm
│   ├── rev2.asm
│   ├── call1.asm
│   ├── sub1.asm
│   ├── nest1.asm
│   ├── param1.asm
│   └── over2.asm
├── lab14/                    # Lab 14: Structured Procedures — PROC, INVOKE, ADDR, LOCAL & USES
│   ├── proc1.asm
│   ├── uses1.asm
│   ├── swap1.asm
│   ├── minmax1.asm
│   └── local1.asm
├── lab15/                    # Lab 15: Stack Frames, Calling Conventions & Recursion
│   ├── frame1.asm
│   ├── fact2.asm
│   ├── fib1.asm
│   └── deep1.asm
├── lab16/                    # Lab 16: Searching, Sorting & 2D Arrays
│   ├── sortlab.asm
│   └── matrix1.asm
├── lab17/                    # Lab 17: High-Level Directives (.IF/.WHILE) & Macros
│   ├── if1.asm
│   ├── loop1.asm
│   ├── mac1.asm
│   ├── mylib.inc
│   ├── mylibp.inc
│   └── libtest.asm
├── lab18/                    # Lab 18: Structures (STRUCT) & Dynamic Memory (HeapAlloc)
│   ├── struct1.asm
│   ├── class1.asm
│   ├── heap1.asm
│   ├── heap2.asm
│   ├── mylib.inc
│   └── mylibp.inc
├── lab19/                    # Lab 19: Windows API Programming — MessageBox, Console & Time
│   ├── msg1.asm
│   ├── msg2.asm
│   ├── console1.asm
│   ├── fun1.asm
│   ├── time1.asm
│   ├── clock1.asm
│   ├── compname1.asm
│   └── chk1.asm
├── lab20/                    # Lab 20: File I/O with the Windows API
│   ├── write1.asm
│   ├── gen1.asm
│   ├── read1.asm
│   ├── copy1.asm
│   ├── readall1.asm
│   ├── notes1.asm
│   └── records1.asm
├── lab21/                    # Lab 21: Floating-Point Programming with the x87 FPU
│   ├── fpulib.inc
│   ├── fpu1.asm
│   ├── avg1.asm
│   ├── circle1.asm
│   ├── bits1.asm
│   ├── cmp1.asm
│   └── round1.asm
├── lab22/                    # Lab 22: Reverse Engineering, Crackmes & Binary Patching in x32dbg
│   ├── tiny1.asm
│   ├── tiny1.exe             # Pre-built PE binary for Task 1.1
│   ├── functions_F1_to_F6.asm
│   ├── mystery1.exe          # Pre-built binary for Task 3.1 (Secret Number)
│   ├── mystery2.exe          # Pre-built binary for Task 3.2 (License Key Check)
│   ├── mystery3.exe          # Pre-built binary for Task 3.3 & 4.2 (Buggy Sum 1..10)
│   ├── mystery4.exe          # Pre-built binary for Exercise 5 (Buggy Sum 1..n)
│   └── mystery_src/          # Reference .asm source code for mystery1..4
│       ├── mystery1.asm
│       ├── mystery2.asm
│       ├── mystery3.asm
│       └── mystery4.asm
└── lab23/                    # Lab 23: Final Capstone Project & Debugging Clinic
    ├── project_skeleton.asm  # Mini-Project starter template
    ├── bug_hunt.asm          # Source code with 3 intentional bugs for Section C
    ├── clinic1.exe           # Pre-built binary of bug_hunt.asm for x32dbg diagnosis
    ├── mylib.inc
    └── mylibp.inc
```

---

## How to Use

1. **Setup Workspace:** Copy or clone this repository into `C:\asmlab\` so that each lab folder matches the paths used in the workbook (`C:\asmlab\lab01`, `C:\asmlab\lab02`, ..., `C:\asmlab\lab23`).
2. **Running in ASM Visual:** Open any `.asm` file in **ASM Visual** and press **F9** (Execute) to assemble, link, and run.
3. **Debugging in x32dbg:** After building any `.asm` file (or using the pre-built `.exe` files in `lab22/` and `lab23/`), open the resulting `.exe` in **x32dbg**, press **F9** to reach the entry point, and step through your instructions with **F7** (Step Into) or **F8** (Step Over).
