.data
  msg: .asciiz "Enter an Integer: "  # declare a message asking user for integer input
  msgresult: .asciiz "The factorial is: " #a message that says "The factorial is:"
  inputnum: .word 0
  factorialnum: .word 0

.text
	.globl main # How can .globl help us here?
	main:
	li $v0, 4	#this block prints the message
	la $a0, msg
	syscall

	li $v0, 5	# this block gets the input from user
	syscall
	sw $v0, inputnum #stores the input

	lw $a0, inputnum #loads input 
	jal factorial  #jumps to the function and stores in ra

	sw $v0, factorialnum #v0 into factorialnum
	li $v0,4	#print message code
	la $a0, msgresult #readies print msg
	syscall	#prints
	li $v0, 1	#print int code
	lw $a0, factorialnum #readies print int
	syscall #prints

	li $v0, 10 #exits
	syscall


.globl factorial
factorial:
subu $sp, $sp, 8 #makes space for stack
sw $ra, ($sp) #store new int 
sw $s0, 4($sp) #s0 is next word in stack

li $v0,1 #ready to print int
beq $a0, 0 finishfactorial # if int == 0 jump tp finishfactorial
move $s0, $a0 #move s0 to a0
sub $a0, $a0, 1 #a0 = a0-1
jal factorial #jump to factorial and saves in ra
mult $v0, $s0 #multiply v0 and s0
mflo $v0 #gets multiplication value

finishfactorial:
lw $ra, ($sp) #loads sp in ra
lw $s0, 4($sp) #loads next word in stack to s0
addu $sp, $sp, 8 #sets stack pointer back in place
jr $ra #return address

