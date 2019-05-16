BITS32

extern printf
section .data
    out: db "%d", 10, 0
    i : dd 1
    
section .text
    global main
main:
    mov ebp, esp
  	push ebp
	mov ebp, esp
	loop:
        add DWORD[i],1
        mov edx,0
        mov eax,DWORD[i]
        mov ecx,2
        idiv ecx
        cmp edx,1
        je loop
       
        mov ebx,DWORD[i]
        push ebx
        push out
        call printf
        cmp ebx,100
        jne loop		

       mov eax, 0
       mov esp, ebp
       pop ebp
       ret

