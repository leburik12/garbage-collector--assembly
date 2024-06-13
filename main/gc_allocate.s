.include "gc_defs.s"
.globl gc_allocate

.section .text

allocate_move_break:
  movq %rcx,%r8
  movq %rcx,%rdi
  addq %rdx,%rdi
  movq %rdi, heap_end
  
  movq $BRK_SYSCALL, %rax
  syscall 

  movq $1, HDR_IN_USE_OFFSET(%r8)
  movq %rdx, HDR_SIZE_OFFSET(%r8)

  addq $HEADER_SIZE,%r8
  movq %r8,%rax
  ret

gc_allocate:
  enter $0, $0
  
  pushq $0
  pushq %rdi
  call gc_allocate_internal
  
  movq %rax,%rdx
  popq %rcx

zeroloop:
  movb $0, (%rdx)
  incq %rdx
  loop zeroloop
  leave
  ret
 
gc_allocate_internal:
  movq %rdi,%rdx
  addq $HEADER_SIZE, %rdx
  addq $16, %rdx
  andq $0xffffffffffffff0,%rdx

  movq heap_start, %rsi
  movq heap_end, %rcx

allocate_loop:
  cmpq %rsi, %rcx
  je allocate_move_break
  
  cmpq $0, HDR_IN_USE_OFFSET(%rsi)
  jne try_next_block

  cmpq %rdx, HDR_SIZE_OFFSET(%rsi)
  jb try_next_block

  movq $1, HDR_IN_USE_OFFSET(%rsi)
  addq $HEADER_SIZE, %rsi
  movq %rsi, %rax
  ret

try_next_block:
  addq HDR_SIZE_OFFSET(%rsi), %rsi
  jmp allocate_loop

