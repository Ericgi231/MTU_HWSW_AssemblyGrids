#Eric Grant
#ewgrant
#read two integers, t0 and t1
#print a grid of 0 and 1
#rows based on t0 and columns based on t1
#if the sum of the row+column index is even, print 0, else print 1
#the border is always 1

#assign user input to t0
li $v0, 5
syscall
move $t0, $v0

#exit if invalid
ble $t0, $0, exit

#assign user input to t1
li $v0, 5
syscall
move $t1, $v0

#exit if invalid
ble $t1, $0, exit

#assign s values for later use
li $s0, 2
li $s1, 1

#set t3 to first input
move $t3, $t0

#print rows
loopBody:
	#if height correct, end loop
	beqz $t3, loopBodyEnd
	
	#set t4 to second input
	move $t4, $t1
	
	loopBodyInner:
		#if width correct, end loop
		beqz $t4, loopBodyInnerEnd
		
		#if first or last row/column print 1
		beq $t3, $t0, print1
		beq $t3, $s1, print1
		beq $t4, $t1, print1
		beq $t4, $s1, print1
	
		#figure out if row+column is even or odd
		add $t5, $t3, $t4
		div $t5, $s0
		mfhi $t6
		
		#if row+column is odd else even
		beqz $t6, jmpElse1
			#if odd print 1
			li $a0, 1
			li $v0, 1
			syscall
			b jmpEnd1
		jmpElse1:
			#if even print 0
			li $a0, 0
			li $v0, 1
			syscall
		jmpEnd1:
		b innerSkip
	
		print1:
		#print 1
		li $a0, 1
		li $v0, 1
		syscall
	
		innerSkip:
		#decrement column
		subi $t4, $t4, 1
	
		b loopBodyInner
	loopBodyInnerEnd:
	
	#print new line
	addi $a0, $0, 10
	li $v0, 11
	syscall
	
	#decrement row
	subi $t3, $t3, 1
	
	b loopBody
loopBodyEnd:

exit:
#exit
li $v0, 10
syscall
