 .text
	.align 4
	.globl Insertar
	.type Insertar,@function
Insertar:
        # Aqui viene vuestro codigo
	pushl	%ebp
	movl	%esp, %ebp
  subl	$12, %esp
	
	pushl	%ebx
	pushl	%esi
	pushl	%edi
	
	movl	$0, %esi          # i=0 --> %esi
	movl	$-1, %ecx         # lug=-1 --> %ecx
	movl	8(%ebp), %ebx     # @v --> %ebx
do:
	imul	$12, %esi, %edx		# i*12 --> %edx
	movl	4(%ebx,%edx), %eax
if1:
	cmpl	%eax, 16(%ebp)
	jge		else
	movl	%esi, %ecx
	jmp		if2
else:
	incl	%esi
	cmpl	$80000000, %eax
	jne		do
if2:
	cmpl	$80000000, %eax
	jne		while
	movl	%esi, %ecx
while:
	cmpl	$80000000, %eax
	je		endwhile
	incl	%esi
endwhile:
	movl	%esi, %edi        # j=i --> %edi
for:
	cmpl	%ecx, %edi
	jl		endfor
	imul	$12, %edi, %edx		# j*12 --> %edx
	movb	(%ebx, %edx), %al
	movb	%al, 12(%ebx, %edx)
	movl	4(%ebx, %edx), %eax
	movl	%eax, 16(%ebx, %edx)
	movl	8(%ebx, %edx), %eax
	movl	%eax, 20(%ebx, %edx)
	decl	%edi              # j--
	jmp for
endfor:
	# paso de parametros
	pushl	%ecx              # lug --> M[%esp]
	pushl	20(%ebp)          # X.m --> M[%esp]
	pushl	16(%ebp)          # X.k --> M[%esp]
	pushl	12(%ebp)          # X.c --> M[%esp]
	pushl	%ebx              # @v --> M[%esp]
	
	call	Asignar
	addl	$20, %esp
	
	incl	%esi
	movl	%esi, %eax

	popl	%edi
	popl	%esi
	popl	%ebx
  
	movl	%ebp, %esp
	popl	%ebp
	ret
	