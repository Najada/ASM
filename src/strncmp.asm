bits 64
global strncmp:function
section .text
 
strncmp:
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
    cmp ah, 0
    je .compute_equality
    cmp al, 0
    je .compute_equality
    cmp ah, al
    jne .compute_equality
    cmp rcx, rdx
    je .compute_equality
    inc rcx
    jmp .loop
 
  .equal:
    xor rax, rax
    jmp .end
 
  .compute_equality:
    sub al, ah
    movsx rax, al
    cmp rax, 0
    jg .greater
    je .equal
    jmp .lower
 
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
