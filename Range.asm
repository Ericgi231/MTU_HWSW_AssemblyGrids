#Eric Grant
#ewgrant
#read two integers 
#print a line containing all numbers from input 1 to 2
#print a line containing all numbers from input 2 to 1

#assign user input to t0
li $v0, 5
syscall
move $t0, $v0

#assign user input to t1
li $v0, 5
syscall
move $t1, $v0

#exit if invalid
blt $t1, $t0, exit

#set t3 to first input
move $t3, $t0

loop1:
	#end loop if first input > second input
	bgt $t3, $t1, end1
	
	#print t3
	move $a0, $t3
	li $v0, 1
	syscall
	
	#print space
	addi $a0, $0, 32
	li $v0, 11
	syscall
	
	#increment t3
	addi $t3, $t3, 1
	
	b loop1
end1:

#print new line
addi $a0, $0, 10
li $v0, 11
syscall
	
#set t3 to second input
move $t3, $t1

loop2:
	#end loop if first input > second input
	blt $t3, $t0, end2
	
	#print t3
	move $a0, $t3
	li $v0, 1
	syscall
	
	#print space
	addi $a0, $0, 32
	li $v0, 11
	syscall
	
	#decrement t3
	subi $t3, $t3, 1
	
	b loop2
end2:

#print new line
addi $a0, $0, 10
li $v0, 11
syscall

exit:
#exit
li $v0, 10
syscall
