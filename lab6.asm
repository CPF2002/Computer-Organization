.data
	Out: .asciiz "The masked number is: "
.text
	main:
		li $a1, 11
		jal ShowNumber
		
		#li $v0, 10	exits program
		#syscall
		
		li $a1, 11
		jal clearBit
		
		move $a1, $v0
		jal ShowNumber
		
		li $v0, 10
		syscall
		
	ShowNumber: 
		li $v0, 4
		la $a0, Out
		syscall
		
		li $v0, 1
		move $a0, $a1
		syscall
		
		jr $ra
		
	clearBit: 
		addi $sp, $sp, -4	# moves the stack pointer by one word for the number 
		sw $s0, 0($sp)		# The memory space at the pointer has $s0
		
		li $s0, -1		# $s0 = -1
		sll $s0, $s0, 1		# shift left 1 bit to make 10
		and $v0, $a1, $s0	# compares the 11 with the 10 to make 10
		
		lw $s0, 0($sp)
		addi $sp, $sp, 4
		jr $ra
		
		
