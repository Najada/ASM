    bits 64
    global memcpy
    section .text

memcpy:
        push rbp
        mov rbp, rsp

        xor rcx, rcx
        cmp rdi, 0
        je .return

    .loop:
    cmp rcx, rdx
    je .return
    mov ah, byte[rsi + rcx]
    mov byte[rdi + rcx], ah
    inc rcx
    jmp .loop
    
    
    .return:
    mov rax, rdi

    mov rsp, rbp
    pop rbp

    ret


