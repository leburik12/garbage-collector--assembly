.include "gc_defs.s"
.globl gc_is_valid_ptr
.section .text
gc_is_valid_ptr:
   enter $0,$0
   
   movq heap_start, %rcx

loop:
   leaq HEADER_SIZE(%rcx),%rax
   cmpq %rax,%rdi
  
   je valid_ptr
   jb invalid_ptr

   addq HDR_SIZE_OFFSET(%rcx),%rcx
   jmp loop
  
   invalid_ptr:
     movq $0,%rax
     leave
     ret

   valid_ptr:
     movq $1,%rax
     leave 
     ret



   
