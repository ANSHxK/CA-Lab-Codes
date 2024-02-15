# Linear search using procedure
# Input arguments to the procedure: Address of the array, total number of elements and search element
# Return value(s): 0 (element not found) 
#               1 (element found), index
.data
arr: .space 100
msg: .asciiz "Enter values of array\n"
msg2: .asciiz "Enter value "
colon: .asciiz ":"
msg3: .asciiz "Enter element to search: "
f: .asciiz "Element found at index: "
nf: .asciiz "Element not found"
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
move $a2, $v0

la $a0, arr
li $a1, 5

jal lin_search
beq $v0, 0, not_found

li $v0, 4
la $a0, f
syscall

li $v0, 1
move $a0, $v1
syscall

j end

not_found:
li $v0, 4
la $a0, nf
syscall

end:
li $v0, 10
syscall

lin_search:
    li $t0, 0
    li $v0, 0
    loop_fun:
        bge $t0, $a1, exit
        lw $t1, 0($a0)
        beq $a2, $t1, element_found

        addi $t0, $t0, 1
        addi $a0, $a0, 4
        j loop_fun

    element_found:
        li $v0, 1
        move $v1, $t0
        j exit
    exit:
        jr $ra