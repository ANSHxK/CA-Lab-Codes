# 1) switch (i) {
#         case 0:   A[0] = 0;
# 	          break;
#         case 1:
#         case 2:   A[1] = 1;
#                   break;
#         default:  A[0] = -1;
#                   break;
#     }

.data 
arr: .space 200
msg: .asciiz "Enter values of array"
msg2: .asciiz "\nEnter value "
colon: .asciiz ":"
msg3: .asciiz "Enter value of i"
.text
main:
li $v0, 4
la $a0, msg
syscall

li $t0, 5
li $t1, 0
la $t2, arr
loop:
    bge $t1, 5, next

    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 1
    move $a0, $t1
    addi $a0, $a0, 1
    syscall

    li $v0, 4
    la $a0, colon
    syscall

    li $v0, 5
    syscall

    sw $v0, 0($t2)
    addi $t2, $t2, 4
    addi $t1, $t1, 1
j loop

next:

li $v0, 4
la $a0, msg3
syscall

li $v0, 5
syscall
move $t0, $v0

la $t1, arr
beq $t0, 0, case0
beq $t0, 1, case1
beq $t0, 2, case2

li $t3, -1
sw $t3, 0($t1)
j brk

case0:
sw $zero, 0($t1)
j brk

case1:

case2:
addi $t1, $t1, 4
li $t3, 1
sw $t3, 0($t1)
j brk

brk:

li $t0, 5
la $t1, arr
li $t3, 0
loop2:
    bge $t3, $t0, exit
    lw $t2, 0($t1)
    li $v0, 1
    move $a0, $t2
    syscall

    addi $t3, $t3, 1
    addi $t1, $t1, 4
j loop2

exit:
li $v0, 10
syscall