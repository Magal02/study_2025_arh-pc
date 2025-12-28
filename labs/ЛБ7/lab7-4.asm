%include 'in_out.asm'
SECTION .data
   msg1: DB 'Введите x: ',0h
   msg2: DB 'Введите a: ',0h
   otv: DB 'F(x) = ',0h
SECTION .bss
   x: RESB 80
   a: RESB 80
   res: RESB 80
SECTION .text
   GLOBAL _start
_start:
   mov  eax,msg1
   call sprint
   mov ecx,x
   mov  edx,80
   call sread
   mov eax,x
   call atoi
   mov  [x],eax
   mov  eax,msg2
   call sprint
   mov ecx,a
   mov edx,80
   call sread
   mov eax,a
   call atoi
   mov [a],eax
   cmp eax,[x]
   jg check_A
   mov ecx,[x]
   sub ecx,[a]
   mov [res],ecx
   jmp fin
check_A:
   mov ecx,5
   mov [res],ecx
   jmp fin
fin:
   mov  eax, otv
   call sprint
   mov  eax,[res]
   call iprintLF
   call quit