    bits 64
    global strchr
    section .text

strchr:
        push rbp
        mov rbp, rsp

        xor rcx, rcx
        cmp rdi, 0
        je .return

    
    .loop:
    cmp byte[rdi + rcx], 0
    je .return
    cmp byte[rdi + rcx], sil
    je .returnc
    inc rcx
    jmp .loop
    

    .returnc:
    mov r8, rdi
    add r8, rcx
    mov rax, r8
    mov rsp, rbp
    pop rbp

    ret
    
    .return:
    mov rax, 0
    mov rsp, rbp
    pop rbp

    ret
