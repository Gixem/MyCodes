.data
array:  .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
num:    .word 11   # number to search in the array
n:      .word 10   # size of the array

success:    .asciiz "Yeppi - I passed, my student number is in the passing list!"
failed:     .asciiz "Oops - I failed, the number is not in the passing list!"

.text
.globl main
main:
    # load the address of the array into $t0
    la $t0, array
    # load the value of num into $t1
    lw $t1, num
    # load the value of n into $t2
    lw $t2, n
    
loop:
    # if num is not found after we have checked all the elements of the array,
    # go to the 'failed' message
    beq $t2, $zero, not_found
    
    # load the current element of the array into $t3
    lw $t3, ($t0)
    
    # if the current element is equal to num, go to the 'success' message
    beq $t3, $t1, found
    
    # else, move to the next element of the array
    addi $t0, $t0, 4
    addi $t2, $t2, -1
    
    # go to the beginning of the loop for checking the next element
    j loop
    
found:
    # print the 'success' message
    li $v0, 4
    la $a0, success
    syscall
    
    # terminate the program
    li $v0, 10
    syscall
    
not_found:
    # print the 'failed' message
    li $v0, 4
    la $a0, failed
    syscall
    
    # terminate the program
    li $v0, 10
    syscall
