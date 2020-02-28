bits 64
global rindex:function
section .text

rindex:
    push rbp
    mov rbp, rsp

    mov rdx, -1
    xor rcx, rcx

    .loop:
    cmp byte[rdi + rcx], sil
    je .save_index
    inc rcx
    cmp byte[rdi + rcx], 0
    je .return_value
    jmp .loop

    .save_index:
    mov rdx, rcx
    inc rcx
    jmp .loop

    .return_value:
    cmp rdx, -1
    je .return_null
    jmp .value

    .value:
    cmp rdx, 0
    je .save
    inc rdi
    dec rdx
    jmp .value

    .return_null:
    mov rax, 0
    jmp .end

    .save:
    mov rax, rdi
    jmp .end
    
    .end:
 
    mov rsp, rbp
    pop rbp
 
    ret
