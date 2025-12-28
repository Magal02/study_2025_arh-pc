%include 'in_out.asm'
 SECTION .data
 msg: DB 'Введите x: ',0
 div: DB 'Результат: ',0
 SECTION .bss
 rez: RESB 80
 x: RESB 80
 SECTION .text
 GLOBAL _start
  _start:
  mov eax,msg
  call sprintLF
  
  mov ecx,x
  mov edx,80
  call sread
  mov eax,x
  call atoi
  
  mov ebx,eax
  mul eax
  mul ebx
  xor ebx,ebx
  mov ebx,3
  div ebx
  xor ebx,ebx
  add eax,21
  mov [rez],eax
  
  mov eax,div
  call sprint
  mov eax,[rez]
  call iprintLF
  call quit