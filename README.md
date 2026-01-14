# CENG442/442L Microprocessor Design

Credits(4-0)

Presents the tools and concepts required for the design of microprocessors. Emphasis is given to the problems of implementing a specified Instruction Set Architecture, design trade-offs, and the use of development tools in the design process. Students will learn to design and implement a pipelined CPU suitable for use in embedded systems. Design projects will be implemented in the laboratory using VHDL.

## Lab 1
### Datapath and Instruction Decoder Part 1

Introduction:
The purpose of this lab was to design and verify components of a basic RISC-V (RV32I) datapath and instruction decoder using VHDL. The design was targeted to support the standards outline in the latest The RISC-V Instruction Set Manual Volume I: Version 20250508. To simplify implementation and verification, the project was divided into four main components:
- Register File
- Branch Test Unit
- Program Counter (PC)
Arithmetic Logic Unit (ALU)
By modularizing the datapath, each subsystem could be designed, simulated, and verified independently before being integrated into a larger RISC-V datapath.

## Lab 2
### Datapath and Instruction Decoder Part 2

The purpose of this lab was to design the instruction decoder for a basic RISC-V  processor core. The decoder is responsible for interpreting a 32-bit instruction and generating a structured control word that drives the datapath modules (Register File, ALU, Program Counter, and Branch Test Unit).

This design builds on the components created in Lab 1 by providing the control logic required to connect them into a functioning processor core. The ultimate goal is to simulate decoding and execution of various instruction types, verifying correct datapath behavior.

## Lab 3
### Instruction Fetch Unit and Basic Sequencer


The purpose of this lab was to design and implement the instruction fetch unit and basic sequencer for an RISC-V core using VHDL. The fetch unit interacts with memory through an AXI4-Lite read interface to retrieve instructions. The design goal was to successfully execute all non-load/store instructions by correctly sequencing program counter updates and AXI read transactions.

In the RISC-V architecture, the fetch stage is responsible for providing the next instruction to the pipeline. It relies on:
- A Program Counter (PC) register that holds the current instruction address.
- An Instruction Memory Interface, which in this lab is modeled using AMBA AXI4 protocol.
- A Sequencer, which coordinates fetching new instructions and updating the PC.
For this lab, only two AXI channels were required:
- Read Address Channel (AR) – used to request instruction addresses.
- Read Data Channel (R) – used to receive the instruction data.

## Lab 4
### Load/Store Unit Integration

The goal of Lab was to design and integrate a Load/Store Unit (LSU) into the RISC-V processor datapath and modify the sequencer to properly handle all memory access instructions. Upon completion, the CPU was able to execute the full RV32I instruction set, excluding fence and system calls.

The LSU communicates with external memory via an AXI4 bus interface and manages both read and write transactions. It supplements the existing fetch unit, which already implements the AXI instruction-read channel. Together, these modules allow the CPU to perform instruction fetch, data read, and data write operations concurrently under proper control from the sequencer.

## Lab 5
### Instruction Fetch Unit and Basic Sequencer
This laboratory exercise focused on implementing a machine-level interrupt subsystem for a custom RISC-V microarchitecture and optionally integrating it with a real-time output application known as the Cylon Eye LED pattern. The project includes the full design of interrupt prioritization, control and status register (CSR) support, interrupt entry and exit sequencing, and verification using a dedicated testbench. Advanced improvements include simultaneous interrupt handling, clean trap vectoring, and return via the MRET instruction. These features significantly extend the base processor toward real embedded real-time capability.


## Final 
### Interupt 
his RISC-V microcontroller exposes three level-sensitive interrupt sources—`INTERRUPT` (external), `TIMER_INTERRUPT`, and `SOFTWARE_INTERRUPT`. Requests are prioritized external over timer over software, masked by `mstatus.mie` and the corresponding `mie` bits, and collapsed into a single `interrupt_pending` latch and `trap_cause` code for observation on the `TRAP_CAUSE` port. When a request is taken, the core saves the faulting PC into `mepc`, redirects to the fixed vector at `0x00000080`, and holds `trap_active` until an `MRET` (0x30200073) executes. Return uses the latched `mepc` value to restore fetch.

Machine CSRs are handled through the CSRRW/CSRRS/CSRRC paths: `mstatus` (0x300) for the global MIE bit, `mie` (0x304) for per-source enables, `mepc` (0x341) for the saved return PC, and `mcause` (0x342) for the latched cause. A read-only view of the live interrupt pins is exposed at 0x344, and CSR operands may come from either a register source or the immediate field.

The self-checking testbench at `interupt.srcs/sim_1/new/riscv_micro_interrupt_tb.vhdl` pulses simultaneous external and timer interrupts after reset, logs the fetch PC sequence, and asserts that the core vectors to `0x80`, reports the external cause, and returns via `MRET` to the pre-interrupt PC. Use your preferred VHDL simulator to compile the design sources under `interupt.srcs/sources_1/new/` alongside the testbench and run the `riscv_micro_interrupt_tb` top-level.