.data
msg1: .asciiz "Enter any number: "
msg2: .asciiz "Enter a string "
string: .space 64
.text
main:
la $a0, msg1
li $v0, 4
syscall 

li $v0, 5
syscall
move $t0, $v0

la $a0, msg2
li $v0, 4
syscall 

li $v0, 8
la $a0, string
li $a1, 64
syscall

li $v0, 1
move $a0, $t0
syscall

li $v0, 4
la $a0, string
syscall

li $v0, 10
syscall