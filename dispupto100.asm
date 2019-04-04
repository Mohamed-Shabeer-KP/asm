BITS 32

extern printf

section .data
	out: db "%d", 10, 0
	i : dd 1

section .text
	global main

	main:
	push ebp
	mov ebp, esp

	loop:
		mov ebx,DWORD[i]
		push ebx
		push out
		call printf
		add DWORD[i],1
		cmp ebx,100
	jne loop		
		        

	mov eax, 0
        mov esp, ebp
        pop ebp
        ret
