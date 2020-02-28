    bits 64
    global memset
    section .text

memset:
        push rbp
        mov rbp, rsp

        xor rcx, rcx
        cmp rdi, 0
        je .return

    .loop:
    cmp rcx, rdx
    je .return
    mov byte[rdi + rcx], sil
    inc rcx
    jmp .loop

    .return:
    mov rax, rdi

    mov rsp, rbp
    pop rbp

    ret
