.globl gc_scan_cleanup
gc_scan_cleanup:
   movq $BRK_SYSCALL, %rax
   movq heap_end,%rdi
   syscall
