#  length = 10
# array[10] = {1, 24, 56, 78, 90, 100, 323, 4326, 57456, 74554};
# for (i = 0 ; i< length; i++)
# 	printf("%d\n",array[i]);
.data
arr: .word 1, 24, 56, 78, 90, 100, 323, 4326, 57456, 74554
c: .asciiz ", "
.text 
main:
li $t0, 10
la $t1, arr
li $t3, 0
loop:
    bge $t3, $t0, exit
    lw $t2, 0($t1)
    li $v0, 1
    move $a0, $t2
    syscall

    addi $t3, $t3, 1
    addi $t1, $t1, 4

    # so that we dont print last comma 
    blt $t3, $t0, print
    j loop 
    print:
        li $v0, 4
        la $a0, c
        syscall 
j loop

exit:
li $v0, 10
syscall


    
