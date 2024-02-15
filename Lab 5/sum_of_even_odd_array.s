# Sum the even numbers and odd numbers in a word array A and display the result to the user
.data
arr: .word 1, 4, 235, 7645, 2572, 24, 69, 13, 690, 7
msg1: .asciiz "Sum of even numbers: "
msg2: .asciiz "\nSum of odd numbers: "
.text
main:

li $t0, 10
la $t1, arr
li $t2, 0
li $t3, 0 # even sum
li $t4, 0 # odd sum
li $t7, 2
loop:
    beq $t2, $t0, exit 
    lw $t5, 0($t1)

    addi $t2, $t2, 1
    addi $t1, $t1, 4

    rem $t6, $t5, $t7

    beqz $t6, even
        add $t4, $t4, $t5
        j loop 
    even:
        add $t3, $t3, $t5
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