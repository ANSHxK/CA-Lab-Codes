# Recursive binary search
# int bin_search(int A[], int data, int lo, int hi)
# {
#   int mid;
#   if (lo > hi) return -1
#   mid = (lo + high)/2;
#   if ( data == A[mid]) return mid
#   if ( data < A[mid]) return bin_search(A, data, lo, mid-1)
#   return bin_search(A, data, mid+1, high)
# }
.data 
arr: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
msg: .asciiz "Enter element to search: "
f_msg: .asciiz "Element found at: "
nf_msg: .asciiz "Not found"
.text
main:

li $v0, 4
la $a0, msg
syscall

li $v0, 5
syscall

la $a0, arr
move $a1, $v0
li $a2, 0
li $a3, 9

jal bin_search
move $a0, $v0

beq $v0, -1, nf

li $v0, 4
la $a0, f_msg
syscall

li $v0, 1
syscall
j end

nf:
    li $v0, 4
    la $a0, nf_msg
    syscall

end: 
    li $v0, 10
    syscall


bin_search:
    # save values to stack
    addi $sp, $sp, -24
    sw $s0, 0($sp)
    sw $s1, 4($sp)
    sw $s2, 8($sp)
    sw $s3, 12($sp)
    
    sw $ra, 20($sp)

    move $s0, $a0 # add of array
    move $s1, $a1 # element to find
    move $s2, $a2 # lo
    move $s3, $a3 # high
                  # mid in $s4                    
    bge $s2, $s3, not_found

    add $t0, $s2, $s3
    li $t1, 2
    div $t0, $t1
    mflo $s4
    sw $s4, 16($sp)
    
    li $t6, 4
    mul $t7, $s4, $t6
    addu $t2, $s0, $t6
    lw $t3, 0($t2)
    beq $s1, $t3, found

    blt $s1, $t3, less_than

    move $a0, $s0
    move $a1, $s1
    addi $a2, $s4, 1
    move $a3, $s3
    jal bin_search

    less_than:
    move $a0, $s0
    move $a1, $s1
    move $a2, $s2
    addi $a3, $s4, -1
    jal bin_search

    not_found:
        lw $s0, 0($sp)
        lw $s1, 4($sp)
        lw $s2, 8($sp)
        lw $s3, 12($sp)
        lw $s4, 16($sp)
        lw $ra, 20($sp)
        addi $sp, $sp, 24

        li $v0, -1
        jr $ra
    
    found:
        lw $s0, 0($sp)
        lw $s1, 4($sp)
        lw $s2, 8($sp)
        lw $s3, 12($sp)
        lw $s4, 16($sp)
        lw $ra, 20($sp)
        addi $sp, $sp, 24

        move $v0, $s4
        jr $ra
