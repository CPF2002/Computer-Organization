# We must use the coprocessor to compute floating point numbers, for this exercise:
# Declare two floats in MIPS (Do NOT use integers!). 
# Subtract the smaller from the larger and print result to screen. 
# Next, multiply original values together and print to screen. 
# Finally, divide the smaller by the larger and print the result to the screen. 

.data 
	num1: .float 15.56
	num2: .float 2.47
	subState: .asciiz "Subtraction: "
	multState: .asciiz "\nMultiplication: "
	divState: .asciiz "\nDivision: "
	
.text
	lwc1 $f0, num1($zero)	# stores num1 in $f0
	lwc1 $f2, num2($zero)	# stores num2 in $f2
	
	sub.s $f12, $f0, $f2	# 15.56 - 2.47
	li $v0, 4             	# system call code for Print String
	la $a0, subState        # load address of message into $a0
	syscall               	# print the string
	li $v0, 2		# print float
	syscall
	
	mul.s $f12, $f0, $f2
	li $v0, 4             	# system call code for Print String
	la $a0, multState        # load address of message into $a0
	syscall               	# print the string
	li $v0, 2		# print float
	syscall
	
	div.s $f12, $f2, $f0
	li $v0, 4             	# system call code for Print String
	la $a0, divState        # load address of message into $a0
	syscall               	# print the string
	li $v0, 2		# print float
	syscall
	
	
