# Find largest and smallest element of a word array A which has 10 elements.
.data
arr: .word 1, 4, 235, 7645, 2572, 24, 69, 13, 690, 7
msg1: .asciiz "Smallest number is: "
msg2: .asciiz "Largest number is: "
.text
main:

li $t0, 10
la $t1, arr
li $t2, 0
lw $t3, 0($t1) # smallest
lw $t4, 0($t1) # largest
loop:
    beq $t2, $t0, exit 
    lw $t5, 0($t1)

    addi $t2, $t2, 1
    addi $t1, $t1, 4

    bgt $t5, $t3, next
    move $t3, $t5

    next:
    blt $t5, $t4, loop
    move $t4, $t5
j loop


exit:
li $v0, 4
la $a0, msg1
syscall

li $v0, 1
move $a0, $t3
syscall

li $v0, 4
la $a0, msg2
syscall

li $v0, 1
move $a0, $t4
syscall

li $v0, 10
syscall