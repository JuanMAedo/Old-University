		.data
dato:		.word	4
res:		.space	4
		.text
		.globl	main
main:		lw	$s0,dato
		add	$s1,$zero,$zero
		addi	$t0,$zero,0
bucle:		beq	$t0,$s0,end_bucle
		addi	$t0,$t0,1
		add	$s1,$t0,$s1
		j	bucle
end_bucle:	sw	$s1,res
		addi	$v0,$zero,17
		add	$a0,$zero,$zero
		syscall
