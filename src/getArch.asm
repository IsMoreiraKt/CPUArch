%macro getArch 0
  mov eax, 1
  cpuid

  shr edx, 29
  and edx, 1

  mov eax, edx
%endmacro


; %1 -> 32 or 64 bits
; %2 -> message
; %3 -> message length
%macro print 3
  cmp %1, 1
  je %%__print

  mov eax, 4
  mov ebx, 1
  mov ecx, %2
  mov edx, %3
  int 0x80

%%__print:
  mov rax, 1
  mov rdi, 1
  mov rsi, %2
  mov rdx, %3
  syscall
%endmacro


; %1 -> 32 or 64 bits
; %2 -> exit code
%macro exit 2
  cmp %1, 1
  je %%__exit

  mov eax, 1
  mov ebx, %2
  int 0x80

%%__exit:
  mov rax, 60
  xor rdi, %2
  syscall
%endmacro
