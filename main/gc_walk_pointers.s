.include "gc_defs.s"
.globl gc_walk_pointers

.equ LCL_SAVED_RBX,-16
gc_walk_pointers:
   enter $16,$0
   
   movq %rbx, LCL_SAVED_RBX(%rbp)
   
   movq pointer_list_start, %rbx

loop:
   cmpq %rbx, pointer_list_current
   je finished

   movq (%rbx),%rdi
   cmpq $1, HDR_IN_USE_OFFSET - HEADER_SIZE(%rdi)
   je continue
   
   call gc_is_valid_prt
   cmpq $1, %rax
   jne continue

   movq (%rbx), %rdi
   movq $1, HDR_IN_USE_OFFSET - HEADER_SIZE(%rdi)

   movq HDR_SIZE_OFFSET - HEADER_SIZE(%rdi),%rsi
   subq $HEADER_SIZE, %rsi
   call gc_scan_memory

   continue:
     addq $8,%rbx
     jmp loop

   finished:
     movq LCL_SAVED_RBX(%rbp),%rbx
     leave   
     ret	
