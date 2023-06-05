#write a MIPS program that converts a float Fahrenheit temperature to Celsius.
.data 
	fah: .asciiz " degrees Fahrenheit \n"
	cel: .asciiz " degrees Celsius \n"
	a: .float 32	#constants used for conversion
	b: .float 5
	c: .float 9
	
.text 
	# resources used:
	# https://people.cs.pitt.edu/~childers/CS0447/lectures/SlidesLab92Up.pdf
	# https://stackoverflow.com/questions/46210517/mips-input-floating-point-number
	# https://stackoverflow.com/questions/15823762/printing-a-message-in-mips
	
	li $v0, 6	# float input is stored in $f0
	syscall
	
	li $v0, 2	# print float
	mov.s $f12, $f0 #stores input in $f12
	syscall
	
	li $v0, 4              #system call code for Print String
	la $a0, fah            #load address of message into $a0
	syscall                #print the string
	
	l.s $f1, a($zero)	#stores a in $f2
	l.s $f2, b($zero) 	#stores b in $f3
	l.s $f3, c($zero) 	#stores c in $f4
	
	#cel = (fah - 32) * 5 / 9
	#gets printed out of f12
	sub.s $f12, $f0, $f1	# f12 = fah input - 32
	mul.s $f12, $f12, $f2	# f12 *= 5
	div.s $f12, $f12, $f3	# f12 /= 9
	
	li $v0, 2
	syscall
	
	li $v0, 4              #system call code for Print String
	la $a0, cel            #load address of message into $a0
	syscall                #print the string
	
	
