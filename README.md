Garbage Collection Readme
Introduction
    This repository contains an implementation of a simple garbage collector (GC) written in assembly language using NASM syntax with GAS assembler for x86-64 architecture. The GC is designed to manage memory allocation and deallocation in a memory-efficient manner for programs written in assembly language.

Code Structure
The repository is organized into several assembly files:
    gc_defs.s: Defines constants and offsets used in the garbage collector.
    gc_globals.s: Defines global variables such as heap boundaries and pointer lists.
    gc_init.s: Initializes the garbage collector by setting up the heap.
    gc_is_valid_ptr.s: Checks whether a given pointer is valid within the managed heap.
    gc_scan_base_objects.s: Scans base objects such as the stack and global data for pointers.
    gc_scan_cleanup.s: Cleans up the garbage collector after scanning.
    gc_scan_init.s: Initializes the scanning process.
    gc_unmark_all.s: Unmarks all objects in the heap.
    gc_walk_pointers.s: Walks through the pointer list and performs necessary operations.
Usage
To use the garbage collector in your assembly programs, follow these steps:

Include the necessary files in your assembly code
    .include "gc_defs.s"
    .include "gc_globals.s"
    ; Include other necessary files
Call gc_init to initialize the garbage collector before any memory allocation:
    call gc_init
Use gc_allocate to allocate memory. This function returns a pointer to the allocated memory block.

Use gc_scan_base_objects to scan the stack and global data for pointers.

At appropriate points in your program, call gc_walk_pointers to scan and update pointers in your data structures.

When necessary, call gc_unmark_all to unmark all objects in the heap.

Finally, call gc_scan_cleanup to clean up after scanning

Author 
 Kirubel Awoke

Acknowledgments
  Learn to program to Assembly Book

 
