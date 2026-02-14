# Interrupt implementation summary

This document summarizes the interrupt-related enhancements and supporting fixes for the `riscv_micro` core.

## Interrupt sources and priority
- Added three level-sensitive sources: external (`INTERRUPT`), timer (`TIMER_INTERRUPT`), and software (`SOFTWARE_INTERRUPT`).
- Requests are masked by `mstatus.mie` plus the corresponding `mie` bits, then prioritized external over timer over software before latching into `interrupt_pending` with a captured `trap_cause`.
- On a taken interrupt, the core saves the faulting PC to `mepc`, vectors to address `0x00000080`, and holds `trap_active` until an `MRET` instruction returns to the saved `mepc`.

## CSR support
- Implemented CSR read/modify/write decoding for CSRRW, CSRRS, and CSRRC, allowing register or immediate operands.
- Machine CSRs include `mstatus` (global MIE), `mie` (per-source enables), `mepc` (return PC), and `mcause` (latched cause), with a read-only view of live interrupt pins at `0x344`.
- Interrupt acceptance is gated by these CSRs, aligning the external, timer, and software sources with the RISC-V machine-level model.

## Testbench coverage
- The `riscv_micro_interrupt_tb` testbench pulses simultaneous external and timer interrupts after reset and checks that the core vectors to `0x00000080`, reports the external cause, executes `MRET`, and resumes at the pre-interrupt PC.
- Fetch addresses are logged for debug visibility, and the run window was extended to allow sufficient fetches before declaring a failure.

## Supporting microarchitectural fixes
- Sequencer reset was tightened so the state machine deterministically enters the fetch state after reset.
- Control-word clearing was deferred until the load/store clear phase, allowing the `load_store_unit` to issue D-side AXI transactions when requested.
