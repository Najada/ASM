    bits 64
    global strlen
    section .text

strlen:
        push rbp
        mov rbp, rsp


        xor rcx, rcx
        cmp rdi, 0
        je .return

    .loop:
    cmp byte[rdi + rcx], 0
    je .return
    inc rcx
    jmp .loop


    .return:
    mov rax, rcx
    
        mov rsp, rbp
        pop rbp
    ret
