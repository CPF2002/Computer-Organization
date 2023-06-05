.data
	num1: .word 2	# creating variables with ints inside
	
.text
	lw $t0, num1($zero)	# assigning ints to a register
	
	addi $t0, $t0, 4	# $t2 = 2 + 4
	
	li $v0, 1		# load imediately ; $v0 register stores result ; 1 system call code for print integer
				
	add $a0, $zero, $t0	# the value has to be in $a0 register to print into the screen
	syscall 		# uses the system call in $v0 on line 9
