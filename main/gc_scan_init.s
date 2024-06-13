.globl gc_scan_init
.section .rodata
.section .text
gc_scan_init:
  enter $0,$0
  movq $rsp,stack_end
  
  movq stack_start, %rdi
  subq %rsp, %rdi
  movq $.rodata, %rdx
  
  andq $0xffffffffffffff8, %rdi
  movq $_end,%rcx
  subq %rdx, %rcx
  addq %rcx, %rdi
  
  # head size
  movq heap_end, %rdx
  subq heap_start, %rdx
  addq %rdx, %rdi

  movq pointer_list_start, %rdx
  addq %rdx, %rdi
  movq %rdi, pointer_list_end

  movq %rdx, pointer_list_current
  
  movq $BRK_SYSCALL, %rax
  syscall

  leave
  ret

