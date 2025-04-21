section .data
  text db "hello, world", 10, 0
  text2 db "hello, asm", 10, 0

  
section .text
  global _start
  
_start:
  mov rax, text
  call _print

  mov rax, text2
  call _print
  
  mov rax, 60
  mov rdi, 0
  syscall


;input: rax as pointer to string
;output: print string at rax
_print:
  push rax
  mov rbx, 0 ; initialize counter as 0

_printLoop:
  inc rax
  inc rbx ; counting the size of string
  mov cl, [rax]
  cmp cl, 0 ;if the str[i] == 0 then break
  jne _printLoop

  mov rax, 1
  mov rdi, 1
  pop rsi
  mov rdx, rbx
  syscall

  ret