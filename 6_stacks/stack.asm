section .data
  digit db 0, 10
  
section .text
  global _start
  
_start:
  
  push 2
  push 4
  push 3

  pop rax
  call _printRAXDigit
  pop rax
  call _printRAXDigit
  pop rax
  call _printRAXDigit

  mov rax, 60
  mov rdi, 0
  syscall

_printRAXDigit: ;lets print 0
  add rax, 48 ;ascii of 0 is 48
  mov [digit], al ;mov the lower byte in digit

  mov rax, 1
  mov rdi, 1
  mov rsi, digit
  mov rdx, 2 ;newline and digit two bits
  syscall
  ret