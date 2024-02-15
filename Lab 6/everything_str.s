# 2. Reverse a string stored in memory. Store the reversed string in memory. Also display the reversed string to the user.
# 3. Find if a given string is palindrome or not and print the result to the user.
# 4. Concatenate two strings into a single string.
.data
str: .space 64
strev: .space 64
msg1: .asciiz "Enter a string: "
msg2: .asciiz "Reversed string: "
msg3: .asciiz "\nIt is a palindrome"
msg4: .asciiz "\nIt is not a palindrome"
msg5: .asciiz "\nConcatenated string is: "
.text
main:
li $v0, 4
la $a0, msg1
syscall

li $v0, 8
la $a0, str
li $a1, 64
syscall

# Find end of str
la $t0, str # address input str
li $t1, 0 # length of string
loop1:
    lbu $t2, 0($t0)
    beqz $t2, next1
    addi $t1, $t1, 1
    addi $t0, $t0, 1
j loop1

next1:
# change address pointer and length to real end (removing null and \n)
addi $t0, $t0, -2 # address pointer is now pointing to \n + 1 position of str
addi $t1, $t1, -1 # length has original len + 1 as count of \n was also taken
# get reverse of string and store in strev
la $t3, strev # address of reversed str
loop2:
    beqz $t1, next2
    lbu $t4, 0($t0) # loading characters from input str in reverse order
    sb $t4, 0($t3) # store in strev from start
    addi $t1, $t1, -1
    addi $t0, $t0, -1
    addi $t3, $t3, 1
j loop2

next2:
li $t5, 10
sb $t5, 0($t3) # add \n to end of strev ($t3 points to end of strev)
addi $t3, $t3, 1
sb $zero, 0($t3) # add null value as well to end to strev

li $v0, 4
la $a0, msg2
syscall

li $v0, 4
la $a0, strev
syscall

# check if str is palindrome
la $t0, str
la $t1, strev

loop3:
    lbu $t2, 0($t0)
    lbu $t3, 0($t1)
    beqz $t2, pal
    bne $t2, $t3, notpal
    addi $t0, $t0, 1
    addi $t1, $t1, 1
j loop3

pal:
    li $v0, 4
    la $a0, msg3
    syscall
    j next3

notpal:
    li $v0, 4
    la $a0, msg4
    syscall
    j next3

# concat the strings
next3:
la $t0, str
la $t1, strev
# find end to str again
loop4:
    lbu $t2, 0($t0)
    beqz $t2, next4
    addi $t0, $t0, 1
j loop4

next4:
addi $t0, $t0, -1 # shift 1 back as \n is considered

loop5:
    lbu $t2, 0($t1)
    beqz $t2, next5
    sb $t2, 0($t0)
    addi $t0, $t0, 1
    addi $t1, $t1, 1
j loop5

next5:
li $v0, 4
la $a0, msg5
syscall

li $v0, 4
la $a0, str
syscall

li $v0, 10
syscall


