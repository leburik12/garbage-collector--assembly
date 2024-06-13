.include "gc_defs.s"
.globl heap_start, heap_end, stack_start,stack_end
.globl pointer_list_start, pointer_list_end, pointer_list_current

.section .data
heap_start:
  .quad 0
heap_end:
  .quad 0
stack_start:
  .quad 0
stack_end:
  .quad 0
.equ pointer_list_start, head_end # These are the same
pointer_list_end:
  .quad 0
pointer_list_current:
  .quad 0

