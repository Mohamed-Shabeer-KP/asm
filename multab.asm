BITS 32

extern printf

section .data
	out : db "%d * %d = %d", 10,0
	newline : db "",10,0
	i : dd 1
	j : dd 1
	
section .text
	global main

	main:
	push ebp
	mov ebp, esp

	loop:
	mov eax,DWORD[i]	
	mov ebx,DWORD[j]
	mov ecx,1
	imul ecx,eax
	imul ecx,ebx	
	push ecx
	push ebx
	push eax
	push out
	call printf

	add DWORD[j],1
	cmp DWORD[j],10
	jle loop

	push newline
	call printf 
	mov DWORD[j],1
	add DWORD[i],1	
	cmp DWORD[i],10
	jle loop	

	mov eax, 0
        mov esp, ebp
        pop ebp
        ret
