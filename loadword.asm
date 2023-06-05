# Demo using load word

.data	# initial address of data is 0x10010000

temp: .ascii "0123456789ABCDEF"	# the ascii directive calls label temp 16 bytes of memory inititated 

.text	# initial address of data is 0x10010000

.globl my_main	# we declare a main routine because eventually we will have subroutines

my_main:
	li $s0, 0x10010000	# base address of data 0 stored at 10010000 then 1 stored at 10010001
	lw $t1, 0($s0)		# add offset of 0, go to that location, grab 32 bits and put in to s1
	# so notice it is loading in 10010000, 10010001, 10010002, 10010003
	# lw $t1, 1($s0) cannot do, not multiple of 4 and aligned with a word!
	lw $t2, 4($s0)		# R[$t2] = M[R[[$s0] + 4] offsetting 4 bytes so going to 10010004
	
	lw $t3, 8($s0)
	
	lw $t4, 12($s0)
	
	lw $t5, 0x0c($s0)	# R[$t2] = M[R[[$s0] + 12 
	
	# to exit
	li $v0, 10
	syscall
	
	
