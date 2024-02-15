# Print fibonacci series using procedures
# Input arguments to the procedure: No. of terms
# fib(0) = 0
# fib(1) = 1
# fib(n) = fib(n-1) + fib(n-2)

# 0, 1, 1, 2, 3, 5, 8, 13, 21,…

# int fibo(int n)
# {
#     if (n == 0 || n == 1)
#         return n;
#     else
#         return fibo(n - 1) + fibo(n - 2);
# }

.data 
msg1: .asciiz "Enter the value of n: "
msg2: .asciiz "\nFibonacci value is: "
.text
main:
li $v0, 4
la $a0, msg1
syscall 

li $v0, 5
syscall

move $a0, $v0

jal fibo
move $t0, $v0

li $v0, 4
la $a0, msg2
syscall 

li $v0, 1
move $a0, $t0
syscall

li $v0, 10
syscall

fibo:
    # save arguments and ra to stack
    addi $sp, $sp, -12
    sw $ra, 0($sp)
    sw $s0, 4($sp)
    sw $s1, 8($sp)
    # if n == 0 or 1 return n
    move $s0, $a0
    beq $s0, 0, done
    beq $s0, 1, done

    addi $a0, $s0, -1
    jal fibo
    move $s1, $v0

    addi $a0, $s0, -2
    jal fibo
    add $v0, $s1, $v0
    j finish

    done:
        move $v0, $s0
        j finish

    finish:
        # load arguments from stack
        lw $ra, 0($sp)
        lw $s0, 4($sp)
        lw $s1, 8($sp)
        addi $sp, $sp, 12
        jr $ra








