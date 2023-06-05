.data 
	numg: .word 5
	numh: .word 10
	numi: .word 3
	numj: .word 2
.text
	lw $t0, numg($zero)	# assign 
	lw $t1, numh($zero)
	lw $t2, numi($zero)
	lw $t3, numj($zero)
	
	add $t0, $t0, $t1	# g = g + h
	add $t2, $t2, $t3	# i = i + j
	sub $t0, $t0, $t2	# g = g - i
	
	li $v0, 1		# load imediately ; $v0 register stores result ; 1 system call code for print integer
				# prepares to bring an output
	add $a0, $zero, $t0	# the value has to be in $a0 register to print into the screen
	syscall
