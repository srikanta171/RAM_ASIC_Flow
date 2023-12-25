
# Single-Port Synchronous Memory Module

## Introduction

This repository contains a Verilog module for a single-port synchronous memory. This type of memory is a fundamental component in digital systems, allowing data to be read from and written to a single memory location (address) at a time.

## Theory

A single-port RAM (Random Access Memory) is a simple form of memory that provides a basic storage mechanism for digital systems. Each memory location in a single-port RAM can store a fixed number of bits (usually a power of 2, such as 8, 16, 32, etc.). During a read operation, the data stored at a specific address is retrieved. During a write operation, new data is stored at a specific address, replacing the previous data.

The term "single-port" comes from the fact that this type of RAM has only one data port, which means that read and write operations cannot occur simultaneously at different addresses. If a write operation is in progress, a read operation must wait, and vice versa.

## Working Principle

The single-port synchronous memory module operates on the rising edge of the clock signal. If a write operation is in progress (signaled by the `we` control signal), the data at the specified address is updated. If a read operation is in progress (signaled by the absence of the `we` control signal), the data from the specified address is loaded into a temporary register.

The data output is controlled by the `oe` (output enable) control signal. If output is enabled and no write operation is in progress, the data from the temporary register is output.

## More About Memory

Computer memory is a broad field with various types. In general, computer memory can be categorized into three types:

1. **Primary Memory**: Also known as main memory, it is used to store data and programs during computer operations. It uses semiconductor technology and is commonly called semiconductor memory. Primary memory is of two types: RAM (Random Access Memory) and ROM (Read-Only Memory).
2. **Secondary Memory**: Provides long-term data storage. Examples include hard disk drives (HDDs), solid-state drives (SSDs), etc.
3. **Cache Memory**: A small-sized type of volatile computer memory that provides high-speed data access to a processor and stores frequently used computer programs, applications, and data.

## Size of the Memory:
The memory size of this single-port synchronous memory module is determined by the `ADDR_WIDTH`, `DATA_WIDTH`, and `DEPTH` parameters. 

In this case, the address width (`ADDR_WIDTH`) is 4 bits, the data width (`DATA_WIDTH`) is 32 bits, and the depth (`DEPTH`) is 16. This means there are 16 (2^4) memory locations, each capable of storing 32 bits of data. 

Therefore, the total memory size is `16 locations * 32 bits/location = 512 bits`. 

Please note that this is the raw storage capacity of the memory module. The effective storage capacity may be less due to memory management system.
