    bits 64
    global strcspn
    section .text

strcspn:
        push rbp
        mov rbp, rsp

        cmp rdi, 0
        je .null

        cmp rsi, 0
        je .null

        xor rdx, rdx

        .iterate_s:
        cmp byte[rdi + 0], 0
        je .return
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
        inc rdx
        jmp .iterate_s

        .return:
        mov rax, rdx
        jmp .end

        .null:
        mov rax, 0
        jmp .end

        .end:
        mov rsp, rbp
        pop rbp
        ret