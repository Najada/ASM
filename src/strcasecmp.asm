bits 64
global strcasecmp:function
section .text
 
strcasecmp:
  push rbp
  mov rbp, rsp
 
  xor rcx, rcx
  mov rax, rcx
  cmp rsi, 0
  je .equal
  cmp rdi, 0
  je .equal
 
  .loop:
    mov ah, byte[rsi + rcx]
    mov al, byte[rdi + rcx]
    jmp .check_letters

    .check_letters:
    cmp ah, 'a'
    jl .check_letters_2
    jmp .check_letters_z

    .check_letters_z:
    cmp ah, 'z'
    jg .check_letters_2
    sub ah, 32
    jmp .check_letters_2

    .check_letters_2:
    cmp al, 'a'
    jl .check
    jmp .check_letters_z_2

    .check_letters_z_2:
    cmp al, 'z'
    jg .check
    sub al, 32
    jmp .check

    .check:
    cmp ah, 0
    je .compute_equality
    cmp al, 0
    je .compute_equality
    cmp ah, al
    jne .compute_equality
    inc rcx
    jmp .loop
 
  .equal:
    xor rax, rax
    jmp .end
 
    .compute_equality:
    mov r11b, al
    sub al, ah
    movsx rax, al
    cmp rax, 0
    jg .greater
    je .equal
    jmp .lower

    .check_z:
    add al, 32
    cmp al, 0
    je .continue
    jmp .greater

     .check_Z:
    sub al, 32
    cmp al, 0
    je .continue
    jmp .lower

    .continue:
    inc rcx
    jmp .loop
    
    .greater:
    mov rax, 1
    jmp .end
 
  .lower:
    mov rax, -1
    jmp .end
 
  .end:
 
  mov rsp, rbp
  pop rbp
 
  ret
