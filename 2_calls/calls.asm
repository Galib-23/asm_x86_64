section .data
  text db "Hello, world!", 10
  ; 10 means new line here

section .text
  global _start
  
_start:
  call _printHello

  mov rax, 60
  mov rdi, 0
  syscall

_printHello:
  mov rax, 1
  mov rdx, 1
  mov rsi, text
  mov rdx, 14
  syscall
  ret