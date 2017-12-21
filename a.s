	.file	"a.c"
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
	movl	$3, -8(%rbp)
	movl	$1, -12(%rbp)
	movl	$5, -4(%rbp)
	movl	$0, -16(%rbp)
	movl	-12(%rbp), %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	cmpl	%eax, -8(%rbp)
	jge	.L2
	movl	$3, -4(%rbp)
.L2:
	movl	-4(%rbp), %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	cmpl	%eax, -12(%rbp)
	jge	.L3
	movl	$1, -16(%rbp)
	jmp	.L4
.L3:
	movl	-8(%rbp), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -16(%rbp)
.L4:
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.1 20170915 (Red Hat 7.2.1-2)"
	.section	.note.GNU-stack,"",@progbits
