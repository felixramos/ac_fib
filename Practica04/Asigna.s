 .text
	.align 4
	.globl Asignar
	.type Asignar,@function
Asignar:
        # Aqui viene vuestro codigo
	pushl	%ebp
	movl	%esp, %ebp
	
	pushl	%ebx
	pushl	%esi
	
	movl	8(%ebp), %ebx
	imul	$12, 24(%ebp), %esi
	
	movb	12(%ebp), %al
	movb	%al, (%ebx, %esi)
	
	movl	16(%ebp), %eax
	movl	%eax, 4(%ebx, %esi)
	
	movl	20(%ebp), %eax
	movl	%eax, 8(%ebx, %esi)
	
	popl	%esi
	popl	%ebx
	
	movl	%ebp, %esp
	popl	%ebp
	