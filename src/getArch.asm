%macro getArch 0
  mov eax, 1
  cpuid

  shr edx, 29
  and edx, 1

  mov eax, edx
%endmacro
