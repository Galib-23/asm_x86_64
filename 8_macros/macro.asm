section .data
  digit db 0, 10
  
section .text
  global _start
  
;exit macro
%macro exit 0 ;0 is the argc
  mov rax, 60
  mov rdi, 0
  syscall
%endmacro

;print digit macro
%macro printDigit 1 ;1 is argc
  mov rax, %1
  call _printRAXDigit
%endmacro

;print sum macro
%macro printSum 2
  mov rax, %1
  add rax, %2
  call _printRAXDigit
%endmacro


_start:
  
  printDigit 3
  printDigit 4
  printSum 4, 5

  exit


_printRAXDigit: ;lets print 0
  add rax, 48 ;ascii of 0 is 48
  mov [digit], al ;mov the lower byte in digit

  mov rax, 1
  mov rdi, 1
  mov rsi, digit
  mov rdx, 2 ;newline and digit two bits
  syscall
  ret