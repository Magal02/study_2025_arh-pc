%include 'in_out.asm'
SECTION .data
msg db "Результат: ",0
SECTION .bss
prm: RESB 80
SECTION .text
global _start
_start:
   pop ecx
   pop edx
   sub ecx,1
   mov esi,3
next:
   cmp ecx,0h
   jz _end
   pop eax
   call atoi
   mul esi
   add eax,30
   add [prm],eax
   loop next
_end:
   mov eax,msg
   call sprint
   mov eax,[prm]
   call iprintLF
   call quit