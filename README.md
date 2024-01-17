# RTL to GDSII Flow of Single-Port Synchronous Memory
This repository contains materials related to the RTL to GDS flow and the concept of single-port synchronous memory. The aim is to provide a comprehensive understanding of the digital circuit design process and memory theory.

## Abstract:
This project aims to provide a comprehensive understanding of the RTL (Register Transfer Level) to GDS (Graphic Data System) flow, a critical process in digital circuit design. The project covers every step of the flow, from RTL design using hardware description languages, synthesis to gate-level representations, placement and routing, to the final GDSII file generation. A significant portion of the project is dedicated to discussing the concept and theory of memory, with a particular focus on single-port synchronous memory.

## Contents
1. **Single-Port Synchronous Memory:**
2. **ASIC Flow (RTL to GDS Flow):**
---
# Getting Started


## Single-Port Synchronous Memory Module

### Introduction

This repository contains a Verilog module for a single-port synchronous memory. This type of memory is a fundamental component in digital systems, allowing data to be read from and written to a single memory location (address) at a time.

### Theory

A single-port RAM (Random Access Memory) is a simple form of memory that provides a basic storage mechanism for digital systems. Each memory location in a single-port RAM can store a fixed number of bits (usually a power of 2, such as 8, 16, 32, etc.). During a read operation, the data stored at a specific address is retrieved. During a write operation, new data is stored at a specific address, replacing the previous data.

The term "single-port" comes from the fact that this type of RAM has only one data port, which means that read and write operations cannot occur simultaneously at different addresses. If a write operation is in progress, a read operation must wait, and vice versa.

### Working Principle

The single-port synchronous memory module operates on the rising edge of the clock signal. If a write operation is in progress (signaled by the `we` control signal), the data at the specified address is updated. If a read operation is in progress (signaled by the absence of the `we` control signal), the data from the specified address is loaded into a temporary register.

The data output is controlled by the `oe` (output enable) control signal. If output is enabled and no write operation is in progress, the data from the temporary register is output.

### More About Memory

Computer memory is a broad field with various types. In general, computer memory can be categorized into three types:

1. **Primary Memory**: Also known as main memory, it is used to store data and programs during computer operations. It uses semiconductor technology and is commonly called semiconductor memory. Primary memory is of two types: RAM (Random Access Memory) and ROM (Read-Only Memory).
2. **Secondary Memory**: Provides long-term data storage. Examples include hard disk drives (HDDs), solid-state drives (SSDs), etc.
3. **Cache Memory**: A small-sized type of volatile computer memory that provides high-speed data access to a processor and stores frequently used computer programs, applications, and data.

### Size of the Memory:
The memory size of this single-port synchronous memory module is determined by the `ADDR_WIDTH`, `DATA_WIDTH`, and `DEPTH` parameters. 

In this case, the address width (`ADDR_WIDTH`) is 4 bits, the data width (`DATA_WIDTH`) is 32 bits, and the depth (`DEPTH`) is 16. This means there are 16 (2^4) memory locations, each capable of storing 32 bits of data. 

Therefore, the total memory size is `16 locations * 32 bits/location = 512 bits`. 

Please note that this is the raw storage capacity of the memory module. The effective storage capacity may be less due to memory management system.


##  ASIC Design Flow: Implementation of this Project from RTL to GDS II

Welcome to our comprehensive guide on ASIC design, where we have designed the project from RTL to GDS II. This guide is perfect for those who want to see theory put into practice and gain hands-on experience.
### Content Overview
- **RTL Design**
- **RTL Simulation**
- **Logic Synthesis**
- **Physical Design**
  - **Design Import**
  - **Floorplan (includes Powerplan)**
  - **Placement & Place Opt**
  - **Clock Tree Synthesis & CTS Opt**
  - **Routing & Route Opt**

---

### Let's get started

- **RTL Design**: Understand how we converted the project specifications into RTL code using Verilog/VHDL.
  - For a details understanding of the design [follow this](rtl/ram.v).
- **RTL Simulation**: Understand how we simulated the RTL code to verify the design functionality.
  - ![image](https://github.com/srikanta171/RAM_ASIC_Flow/blob/main/simulation/Screenshot%20from%202023-12-20%2018-25-20.png)
- **Logic Synthesis**: Discover how we synthesized the RTL code into a gate-level netlist.
---
The commands I have provided [here](synthesis/scirpt_synthesis.tcl) are used for the synthesis of a hardware design. The commands are a sequence of commands that are executed in a tool Genus. The commands are used to synthesize the RTL design, into a gate-level netlist. The netlist is then used for further stages of the design flow such as place and route, timing analysis, power analysis, etc.

## Here is the graphical view:
![image](https://github.com/srikanta171/RAM_ASIC_Flow/blob/main/synthesis/syn_img.gif)
- **Physical Design**: Delve into the Place and Route process and how we created the final GDSII file.

---

### ASIC Physical Design Flow:

Welcome to our comprehensive guide on ASIC Physical Design Flow, also known as Netlist to GDSII Flow or PNR Flow. This guide is perfect for those who want to understand the practical aspects of chip creation.

#### Let's get started

- **Design Import**: This is the initial phase where the design data is imported into the physical design tools.
When importing a design into Cadence Innovus, the following files are required:

1. Design Netlist File (Verilog): This file is created after the synthesis process and can either be generated using CADENCE Genus. Generally, it is a Modified Netlist, because I have to instantiate IOpad cells to the input and output port. Here is the [modified netlist](synthesis/ram_netlist.v), from [this line](https://github.com/srikanta171/RAM_ASIC_Flow/blob/6846b3bc3edf0fd3ae40dc64d0beab08ebd42a09/synthesis/ram_netlist.v#L2549) modification is required.
2. Physical Library Files (LEF Files): There are three kinds of LEF files required which are:
    * Technology LEF File: This file contains information about the Metal layers, Vias, design rules, etc. for a certain technology.
    * Standard Cell LEF File: This file contains the physical view of the standard cells of the current technology.
    * IO Cell LEF File: This file contains the physical view of the IO cells, corner cells, IO fillers of the current technology.

3. View Definition File: This file is actually called Multi Mode Multi Corner (MMMC) view definition file. This file takes timing library files(.lib files), Capacitance Tables, and SDC files generated during the synthesis stage ([this file](synthesis/ram_sdc.sdc) as inputs. Then creates Best and Worst case rc_corners for PVT analysis of the chip. Also, creates Max and Min libraries for timing and delay.

4. IO Assignment File: [This file](physical_design/ram_iopad.io) is used for assigning the IO pins in a specific order. If this file is not used then the tool will automatically assign the input output ports in a convenient order. This file also places the IO pads and Corner cells.

- **Floorplan (includes Powerplan)**: In this step, the layout of the chip is planned, including the placement of blocks and the power distribution network. Check [my logs](physical_design/innovus.log1) or check [this cmd](https://github.com/srikanta171/RAM_ASIC_Flow/blob/6846b3bc3edf0fd3ae40dc64d0beab08ebd42a09/physical_design/innovus.cmd1#L34) to execute the floorplan.
- **Placement & Place Opt**: After floorplanning, the components of the design are placed onto the layout, and their positions are optimized for performance and other factors. Check [my logs](physical_design/innovus.log1) or check [this cmd](https://github.com/srikanta171/RAM_ASIC_Flow/blob/6846b3bc3edf0fd3ae40dc64d0beab08ebd42a09/physical_design/innovus.cmd1#L60)
- **Clock Tree Synthesis & CTS Opt**: This involves building a clock distribution network (clock tree) across the chip and optimizing it to ensure that all elements receive the clock signal on time. Check 
- **Routing & Route Opt**: The final step involves connecting the components with wires (routing) and optimizing the wire paths to minimize delays and other issues. Check [my logs](physical_design/innovus.log1) or check [this cmd](https://github.com/srikanta171/RAM_ASIC_Flow/blob/6846b3bc3edf0fd3ae40dc64d0beab08ebd42a09/physical_design/innovus.cmd1#L287)

Final Result of the Flow:
![image](https://github.com/srikanta171/RAM_ASIC_Flow/blob/main/physical_design/Screenshot%20from%202023-12-20%2019-49-24.png)
