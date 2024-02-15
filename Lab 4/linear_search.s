# 2. Linear search
# length = 10
# array[10] = {1, 24, 56, 78, 90, 100, 323, 4326, 57456, 74554};
# x = 5;
# for (i = 0; i < length; i++) 
#     if (array[i] == x) 
#     {
# 	printf("Element found at position %d", i);
# 	return;
#     }
# printf("Element not found");
.data
arr: .word 1, 24, 56, 78, 90, 100, 323, 4326, 57456, 74554
msg: .asciiz "Enter number to search: "
found_msg: .asciiz "Number found at "
not_found_msg: .asciiz "Number not found"
.text 
main:
li $v0, 4
la $a0, msg
syscall

li $v0, 5
syscall
move $t4, $v0

li $t0, 10
la $t1, arr
li $t3, 0
loop:
    bge $t3, $t0, not_found
    lw $t2, 0($t1)

    beq $t2, $t4, found

    addi $t3, $t3, 1
    addi $t1, $t1, 4
j loop

found:
    li $v0, 4
    la $a0, found_msg
    syscall
    li $v0, 1
    move $a0, $t3
    addi $a0, $a0, 1
    syscall
    j end

not_found: 
    li $v0, 4
    la $a0, not_found_msg
    syscall
    j end

end:
li $v0, 10
syscall


    
