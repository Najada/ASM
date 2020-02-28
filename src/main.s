	.file	"main.c"
	.text
	.section	.rodata
.LC0:
	.string	"Najada"
.LC1:
	.string	"%d should be [%d]\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$8, %rsp
	.cfi_offset 3, -24
	movl	$.LC0, %esi
	movl	$.LC0, %edi
	call	strcspn
	movl	%eax, %ebx
	movl	$.LC0, %esi
	movl	$.LC0, %edi
	call	strcspn
	movl	%ebx, %edx
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 7.3.1 20180130 (Red Hat 7.3.1-2)"
	.section	.note.GNU-stack,"",@progbits
