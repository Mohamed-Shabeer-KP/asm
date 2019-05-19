BITS 32

extern printf
extern scanf 

section .data
  dispval: db "The value is = %d", 10, 0
  result: db "The Converted value from base-%d to  base-%d = %d  ", 10, 0
  request_ip_data: db "Enter the input data: ", 0 ;prompt input data
  request_ip_base: db "Enter the input base: ", 0 ;prompt input base
  request_conv_base: db "Enter the convert to base: ", 0 ;prompt input data
  ip_data: dd 0
  ip_base: dd 0
  ip_conv_base: dd 0
  pow: dd 0
  tmp: dd 0
  res: dd 0
  i: dd 0
  formatin: db "%d", 0
        
section .code
  global main 
  main:
  push ebp
  mov ebp, esp

  push request_ip_data
  call printf
  push ip_data 
  push formatin  
  call scanf

  mov eax, [ip_data]
  push eax
  push dispval
  call printf

  push request_ip_base
  call printf
  push ip_base 
  push formatin 
  call scanf

  mov ebx, DWORD[ip_base]
  push ebx
  push dispval
  call printf
   
  push request_conv_base
  call printf
  push ip_conv_base 
  push formatin 
  call scanf
  
  mov ecx, DWORD[ip_conv_base]
  push ecx
  push dispval
  call printf
    ; -------to convert from x to y (bases) -> convert x to base 10 then base 10 to base y ---
    ;------------------------convert base x to 10 base --------------------------------
    conv1:
      mov eax,DWORD[ip_data] 
      mov edx,0 ;reminder
      mov ecx,10 ;divisor
      
      idiv ecx
      
      mov DWORD[ip_data],eax
            
      mov eax, DWORD[ip_base]     
      mov DWORD[tmp], eax
      mov ebx, DWORD[i]
        
      cmp ebx,0
      je mult_one
        
      cmp ebx,1
      je mult_base
        
      ;------------------- finding power -----------------------------
      power:
      dec ebx
      POW_LOOP:
          mov ecx, DWORD[ip_base] 
          ADDPOW_LOOP:
              add eax, DWORD[tmp]
          loop ADDPOW_LOOP
          mov DWORD[tmp], eax
          dec ebx
      jnz POW_LOOP
      mov DWORD[pow], eax 
      inc DWORD[i]
      jmp mult
      ;------------------- power found -----------------------------
        
      mult_one:
      mov DWORD[pow],1
      inc DWORD[i]
      jmp mult
      mult_base:
      mov eax,DWORD[ip_base]
      mov DWORD[pow],eax
      inc DWORD[i]
    
      mult:
      imul edx,DWORD[pow]
      add DWORD[res],edx
      
      cmp DWORD[ip_data],0
      jne conv1
         
      ;------------------------convert base 10 to y base -----------------
      mov DWORD[tmp],0 
      mov DWORD[i],0
      mov ebx,0 
      mov eax,DWORD[res] 
      conv2:  
      mov edx,0 
      mov ecx,DWORD[ip_conv_base] 
      
      idiv ecx
      
      mov ecx,1
      mov ebx,DWORD[i]
      
      cmp ebx,0
      je cont
      digp:
      imul ecx,10
      dec ebx
      cmp ebx,0
      jne digp
      
      cont:
      imul edx,ecx

      add DWORD[tmp],edx
      inc DWORD[i]
      
      cmp eax,0
      jne conv2
      
      mov eax,DWORD[tmp]
      mov DWORD[res],eax
      
      disp:
      push DWORD[res]
      push DWORD[ip_conv_base]
      push DWORD[ip_base] 
      push result
      call printf      

  mov eax, 0
  mov esp, ebp
  pop ebp
  ret
   
   
