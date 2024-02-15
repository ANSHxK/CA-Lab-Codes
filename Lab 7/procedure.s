# A main procedure calls procedures named sum, difference, product and quotient. All procedures (except main) takes two numbers (x, y) as input arguments 
# and returns the sum (x + y), difference (x-y), product (x*y) and quotient (x/y) values to the main procedure.
# The result of each operation is displayed to the user.

.data
msg1: .asciiz "Enter value of x: "
msg2: .asciiz "\nEnter value of y: "
sum_msg: .asciiz "\nSum is: "
diff_msg: .asciiz "\nDifference is: "
prod_msg: .asciiz "\nProduct is: "
q_msg: .asciiz "\nQuotient is: "

.text
main:
li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $a1, $v0

li $v0, 4
la $a0, msg2
syscall

li $v0, 5
syscall
move $a2, $v0

jal sum

li $v0, 4
la $a0, sum_msg
syscall

li $v0, 1
move $a0, $v1
syscall

jal diff

li $v0, 4
la $a0, diff_msg
syscall

li $v0, 1
move $a0, $v1
syscall

jal prod

li $v0, 4
la $a0, prod_msg
syscall

li $v0, 1
move $a0, $v1
syscall

jal q

li $v0, 4
la $a0, q_msg
syscall

li $v0, 1
move $a0, $v1
syscall

li $v0, 10
syscall

sum:
    addi $sp, $sp, -4
    sw $s0, 0($sp)
    add $s0, $a1, $a2
    move $v1, $s0
    lw $s0, 0($sp)
    addi $sp, $sp, 4
    jr $ra

diff:
    addi $sp, $sp, -4
    sw $s0, 0($sp)
    sub $s0, $a1, $a2
    move $v1, $s0
    lw $s0, 0($sp)
    addi $sp, $sp, 4
    jr $ra

prod:
    addi $sp, $sp, -4
    sw $s0, 0($sp)
    mul $s0, $a1, $a2
    move $v1, $s0
    lw $s0, 0($sp)
    addi $sp, $sp, 4
    jr $ra

q:
    addi $sp, $sp, -4
    sw $s0, 0($sp)
    div $a1, $a2
    mflo $s0
    move $v1, $s0
    lw $s0, 0($sp)
    addi $sp, $sp, 4
    jr $ra