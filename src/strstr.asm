bits 64
global strstr:function
section .text

strstr:
	push rbp
	mov rbp, rsp

	cmp rdi, 0
	je .null

	cmp rsi, 0
	je .null

	xor rcx, rcx
	
	.iterate_haystack:
	mov al, byte[rdi + rcx]
	mov r9b, byte[rsi + rcx]
	cmp r9b, 0
	jz .found_needle
	cmp al, r9b
	jne .reset
	inc rcx
	jmp .iterate_haystack

	.reset:
	cmp al, 0
	je .null
	inc rdi
	mov rcx, 0
	jmp .iterate_haystack

	.found_needle:
	mov rax, rdi
	jmp .end

	.null:
	mov rax, 0
	
	.end:	
	mov rsp, rbp
	pop rbp

	ret