	.data
dato:	.word	4
res:	.space	4
	.text
	.globl	main
main:
	lui	$1,0x1001
	lw	$s0,0($1)
	add	$s1,$zero,$zero
	addi	$t0,$zero,0
bucle:
	beq	$t0,$s0,end_bucle
	addi	$t0,$t0,1
	add	$s1,$t0,$s1
	j	bucle
end_bucle:
	lui	$1,0x1001
	sw	$s1,4($1)
	addi	$v0,$zero,17
	add	$a0,$zero,$zero
	syscall
