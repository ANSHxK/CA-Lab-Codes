# Write a MIPS program to take the value of 'N' from the user, find the sum of first "N" natural numbers and print the output
.data
msg1: .asciiz "Enter number "
msg2: .asciiz "Factorial of the number is: "
.text
main:
la $a0, msg1
li $v0, 4
syscall 

li $v0, 5
syscall
move $t0, $v0

li $t1, 1
loop:
beqz $t0, exit
mul $t1, $t1, $t0
addi $t0, $t0, -1
j loop

exit:
la $a0, msg2
li $v0, 4
syscall 

li $v0, 1
move $a0, $t1
syscall

li $v0, 10
syscall