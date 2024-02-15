# To read a number N from input and find if the number is odd or even. Display the result to the user.
.data
msg1: .asciiz "Enter a number"
even: .asciiz "Number is even"
odd: .asciiz "Number is odd"
.text
main:
la $a0, msg1
li $v0, 4
syscall 

li $v0, 5
syscall

li $t0, 2
rem $t1, $v0, $t0

beqz $t1, even_jmp

la $a0, odd
li $v0, 4
syscall 
j end

even_jmp:
la $a0, even
li $v0, 4
syscall 

end:
li $v0, 10
syscall