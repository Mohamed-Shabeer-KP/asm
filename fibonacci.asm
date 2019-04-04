BITS 32

extern printf
extern scanf

section .data	
	out:dd "%d",10,0	
	in: dd "%d",0       
	
	lim : dd 0
	i : dd 0
	a : dd 0;1
	b : dd 1;1
	c : dd 0
	
section .text
	global main
	
	main:
	push ebp
	mov ebp,esp

	push lim
	push in
	call scanf
	
	cmp DWORD[lim],0
	je end 
	
	mov eax,DWORD[a]
	push eax
	push out
	call printf
	
	cmp DWORD[lim],1
	je end 	

	mov eax,DWORD[b]
	push eax
	push out
	call printf
	cmp DWORD[lim],2
	je end
	
	sub DWORD[lim],2	
	
	loop:	
	mov DWORD[c],0	
	mov eax,DWORD[c];0	
	add eax,DWORD[a];0
	add eax,DWORD[b];1

	mov ebx,DWORD[b];1
	mov DWORD[a],ebx;1
	mov DWORD[b],eax;1

	push eax
	push out
	call printf	

	add DWORD[i],1
	mov edx,DWORD[i]
	cmp edx,DWORD[lim]
	jl loop

	end:	
	mov eax,0
	mov esp,ebp
	pop ebp
	ret
