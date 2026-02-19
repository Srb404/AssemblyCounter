section .data
  msg     db 'Hello!', 0
  newline db 10

section .bss
  buf     resb 21          ; bufor na cyfry + newline

section .text
global _start

_start:
  xor r8, r8               ; r8 = licznik długości
  mov rcx, msg             ; rcx = iterator (osobny od wskaźnika msg)

loop:
  cmp byte [rcx], 0
  je print
  inc r8
  inc rcx
  jmp loop

print:
  ; write(stdout, msg, length) - długość jawnie z r8
  mov rax, 1
  mov rdi, 1
  mov rsi, msg
  mov rdx, r8
  syscall

  ; write newline
  mov rax, 1
  mov rdi, 1
  mov rsi, newline
  mov rdx, 1
  syscall

  ; konwersja r8 na string dziesiętny w buf (od prawej do lewej)
  mov rbx, buf + 20
  mov byte [rbx], 10       ; newline na końcu
  dec rbx

  mov rax, r8
  mov r9, 10               ; dzielnik

convert:
  xor rdx, rdx
  div r9                   ; rax = iloraz, rdx = reszta (cyfra)
  add dl, '0'
  mov [rbx], dl
  dec rbx
  test rax, rax
  jnz convert

  inc rbx                  ; wskaż pierwszą cyfrę

  ; oblicz długość stringa z liczbą
  mov rdx, buf + 21
  sub rdx, rbx

  ; write(stdout, liczba, len)
  mov rax, 1
  mov rdi, 1
  mov rsi, rbx
  syscall

  ; exit(0)
  mov rax, 60
  mov rdi, 0
  syscall
