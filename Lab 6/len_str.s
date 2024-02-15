# Find the length of a string stored in memory.
.data
str: .space 64
msg1: .asciiz "Enter a string "
msg2: .asciiz "Length of string is: "
sp: .asciiz " "
newline: .asciiz "\n"
.text
main:
li $v0, 4
la $a0, msg1
syscall

li $v0, 8
la $a0, str
li $a1, 64
syscall

li $t0, 0
la $t1, str
li $t9, 0
loop:
    lbu $t2, 0($t1)
    beq $t2, $t9, exit
    addi $t0, $t0, 1
    addi $t1, $t1, 1

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, sp
    syscall

    li $v0, 11
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, newline
    syscall
j loop

exit:
li $v0, 4
la $a0, msg2
syscall

li $v0, 1
addi $t0, $t0, -1
move $a0, $t0
syscall

li $v0, 10
syscall