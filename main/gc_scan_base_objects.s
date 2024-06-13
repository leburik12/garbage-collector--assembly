.globl gc_scan_base_objects
.section .rodata
.section .text
gc_scan_base_objects:
   enter $0,$0
   
   movq stack_end, %rdi
   movq stack_start, %rsi
   subq %rdi,%rsi
   call gc_scan_memory
   
   movq $.rodata, %rdi
   andq $0xffffffffffffff8, %rdi
   movq $_end,%rsi
   subq %rdi, %rsi
   call gc_scan_memory
   
   leave 
   ret

