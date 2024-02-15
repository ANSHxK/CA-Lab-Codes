# Assume you have two word arrays A and B that have 5 elements each. Assume the elements of the arrays are stored in memory. Sum the corresponding elements of the two arrays A and B and store the result in word array C kept in memory. Display the elements of array c to user.
# length = 5
# A[5] = {1, 2, 3, 4, 5};
# B[5] = {1, 2, 3, 4, 5};

# for (i = 0 ; i< 5; i++)
# 	C[i] = A[i] + B[i]

# printf("The sum is")
# for (i = 0 ; i< 5; i++)
# 	printf("%d\n", C[i]);

.data
arr1: .word 1, 2, 3, 4, 5
arr2: .word 1, 2, 3, 4, 5
arr3: .space 20
c: .asciiz ", "
.text
main:
li $t0, 5
li $t7, 0
la $t1, arr1
la $t2, arr2
la $t3, arr3
loop:
    beq $t0, $t7, exit
    lw $t4, 0($t1)
    lw $t5, 0($t2)
    add $t6, $t4, $t5
    sw $t6, 0($t3)

    addi $t7, $t7, 1
    addi $t1, $t1, 4
    addi $t2, $t2, 4
    addi $t3, $t3, 4

j loop

exit:

li $t7, 0
la $t3, arr3
loop2:
    bge $t7, $t0, end
    lw $t2, 0($t3)
    li $v0, 1
    move $a0, $t2
    syscall

    addi $t7, $t7, 1
    addi $t3, $t3, 4

    # so that we dont print last comma 
    blt $t7, $t0, print
    j loop2 
    print:
        li $v0, 4
        la $a0, c
        syscall 
j loop2

end:
li $v0, 10
syscall
