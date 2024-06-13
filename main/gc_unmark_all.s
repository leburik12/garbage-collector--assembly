.include "gc_defs.s"
.globl gc_unmark_all

.section .text
gc_unmark_all:
   enter $0,$0
   movq heap_start,%rcx
   movq heap_end,%rdx

   loop:
    cmpq %rcx,%rdx
    je finish
  
    movq $0, HDR_IN_USE_OFFSET(%rcx)
    addq HDR_SIZE_OFFSET(%rcx),%rcx
    jmp loop

finish:
   leave
   ret

