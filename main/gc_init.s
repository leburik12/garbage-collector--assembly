.globl gc_init
.section .text
gc_init:
  movq %rbp, stack_start
  movq $BRK_SYSCALL, %rax
  movq $0,%rdi
  syscall

  movq %rax, heap_start
  movq %rax, heap_end
  ret


