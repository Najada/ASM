bits 64
global memmove:function
section .text
 
memmove:
  push rbp
  mov rbp, rsp
 
  xor rcx, rcx
  cmp rdi, 0
  je .end
  cmp rsi, 0
  je .end
 
  mov rax, rdi
  mov r8, rdi
  sub r8, rsi
  cmp r8, 0
  jge .overlap
 
  .loop:
    cmp rdx, rcx
    je .end
    mov r8b, [rsi + rcx]
    mov [rdi + rcx], r8b
    inc rcx
    jmp .loop
 
  .overlap:
    dec rdx
    jmp .overlap_loop
 
  .overlap_loop:
    cmp rdx,    0
    jl  .end
    mov r8b,    [rsi + rdx]
    mov [rdi + rdx],    r8b
    dec rdx
    jmp .overlap_loop
 
  .end:
    mov rax, rdi
 
  mov rsp, rbp
  pop rbp
 
  ret
