    bits 64
    global strpbrk
    section .text

strpbrk:
        push rbp
        mov rbp, rsp

        cmp rdi, 0
        je .null

        cmp rsi, 0
        je .null

        .iterate_s:
        cmp byte[rdi + 0], 0
        je .null
        mov r9, rsi
        xor rcx, rcx
        jmp .iterate_accept

        .iterate_accept:
        cmp byte[r9 + rcx], 0
        je .increment
        mov al, byte[rdi + 0]
        cmp byte[r9 + rcx], al
        je .return
        inc rcx
        jmp .iterate_accept

        .increment:
        inc rdi
        jmp .iterate_s

        .return:
        mov rax, rdi
        jmp .end

        .null:
        mov rax, 0
        jmp .end

        .end:
        mov rsp, rbp
        pop rbp
        ret