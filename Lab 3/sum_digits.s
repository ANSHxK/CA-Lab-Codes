# To find the sum of the digits of a number N. Display the result to the user.
# sum = 0;
# while (N != 0)
# {
#       remainder = N % 10;
#       sum       = sum + remainder;
#       N         = N / 10;
# }
.data
msg1: .asciiz "Enter a number"
msg2: .asciiz "Sum of digits is: "
.text
main:
la $a0, msg1
li $v0, 4
syscall 

li $v0, 5
syscall

move $t0, $v0
li $t1, 0
li $t2, 10

loop:
    beqz $t0, end
    rem $t3, $t0, $t2
    add $t1, $t1, $t3
    div $t0, $t2
    mflo $t0
j loop

end:
li $v0, 10
syscall