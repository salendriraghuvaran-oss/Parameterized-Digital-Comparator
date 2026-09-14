# 4-bit Digital Comparator

A 4-bit digital comparator designed using Boolean logic and implemented using Verilog RTL. The design compares two 4-bit unsigned binary numbers and generates three outputs indicating whether A is greater than, equal to, or less than B.

## Overview

A digital comparator is a combinational circuit used to compare two binary numbers.

For this project:

- `A > B` → `G = 1`
- `A = B` → `E = 1`
- `A < B` → `L = 1`

The comparator was first derived using Boolean logic and then implemented in Verilog RTL.

## Design Specifications

| Parameter | Value |
|---|---|
| Comparator Width | 4-bit |
| Inputs | A[3:0], B[3:0] |
| Outputs | G, E, L |
| Circuit Type | Combinational |
| FPGA Board | Zynq-7000 |
| Design Tool | Xilinx Vivado |

## 1-bit Comparator

For each bit, the comparator generates three intermediate signals.

### Greater-than

`gᵢ = Aᵢ · Bᵢ'`

### Equality

`eᵢ = Aᵢ XNOR Bᵢ`

### Less-than

`lᵢ = Aᵢ' · Bᵢ`

### 1-bit Truth Table

| A | B | G | E | L |
|---|---|---|---|---|
| 0 | 0 | 0 | 1 | 0 |
| 0 | 1 | 0 | 0 | 1 |
| 1 | 0 | 1 | 0 | 0 |
| 1 | 1 | 0 | 1 | 0 |

## 4-bit Comparator Logic

For a 4-bit comparison, the most significant bit is compared first.

If the MSBs are different, they determine the result.

If they are equal, the comparison proceeds to the next bit.

For:

`A = A₃A₂A₁A₀`

`B = B₃B₂B₁B₀`

The output equations are:

### Greater-than

`G = g₃ + e₃g₂ + e₃e₂g₁ + e₃e₂e₁g₀`

### Equality

`E = e₃e₂e₁e₀`

### Less-than

`L = l₃ + e₃l₂ + e₃e₂l₁ + e₃e₂e₁l₀`

## Design Flow

```text
Specification
      ↓
Truth Table
      ↓
Boolean Equations
      ↓
Gate-Level Logic
      ↓
Verilog RTL
      ↓
Simulation
      ↓
Exhaustive Verification
      ↓
Synthesis
      ↓
Implementation
      ↓
Timing Analysis
      ↓
Power Analysis

RTL Implementation

The main design is implemented in:

rtl/comparator_logic.v

A parameterized behavioral comparator is also included as a reference model:

rtl/comparator_parameterized.v

Verification

The design was verified using a self-checking testbench.

The testbench uses the parameterized behavioral comparator as a reference model and compares its outputs with the Boolean-logic implementation.

Since each input is 4 bits:

A → 16 possible values
B → 16 possible values

Therefore:

16 × 16 = 256

All 256 possible input combinations were exhaustively verified.

Testbench:

tb/comparator_logic_tb.v

Synthesis Results

The design was synthesized using Xilinx Vivado for a Zynq-7000 FPGA device.

Resource	Result
Slice LUTs	6
Flip-Flops	0
I/O	11

The comparator is purely combinational, so no flip-flops are required.

Timing Analysis

Timing constraints were applied using a 10 ns virtual clock.

Input Delay  = 3 ns
Output Delay = 2 ns

Post-implementation timing results:

Parameter	Result
WNS	-1.490 ns
TNS	-3.850 ns
WHS	+6.040 ns
THS	0.000 ns
Failing Endpoints	3

The design did not meet the specified setup timing constraint in this experiment.

The negative slack is documented rather than hidden, providing an opportunity for further timing optimization.

Power Analysis

Post-implementation estimated power:

Parameter	Result
Total On-Chip Power	0.105 W
Dynamic Power	0.001 W
Static Power	0.104 W
Junction Temperature	26.2 °C

These values are Vivado FPGA power estimates and are not direct measurements from the physical board.

Project Documentation
Truth Table

Boolean Equations and 1-bit Circuit

4-bit Comparator Design Derivation

Synthesis Schematic

Implementation Schematic

Utilization Report

Post-Implementation Timing

Power Report

Files
Parameterized-Digital-Comparator/
│
├── rtl/
│   ├── comparator_logic.v
│   └── comparator_parameterized.v
│
├── tb/
│   └── comparator_logic_tb.v
│
├── constraints/
│   └── comparator_logic.xdc
│
├── docs/
│   ├── truthtable.jpeg
│   ├── boolean_equations_and_1bit_circuit.jpg
│   ├── 4bit_comparator_derivation.jpg
│   ├── synthesis_schematic.png
│   ├── implementation_schematic.png
│   ├── utilization.png
│   ├── post_implementation_timing.png
│   └── power_report.png
│
└── README.md
Future Improvements
Develop a truly parameterized structural comparator supporting arbitrary widths.
Perform timing optimization.
Compare different comparator architectures.
Analyze area, power, and timing trade-offs.
Explore the same RTL design using an ASIC standard-cell flow.
Key Learning Outcomes

Through this project, the following concepts were studied:

Digital comparator design
Boolean logic derivation
Combinational RTL design
Verilog
Testbench development
Exhaustive verification
FPGA synthesis
RTL-to-netlist flow
Resource utilization
Timing analysis
Post-implementation analysis
Power estimation
Author

Raghuvaran

VLSI / RTL Design Project
