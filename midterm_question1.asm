.data
array:  .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
index:  .word 4

.text
.globl main
main:
    # Load the base address of 'array' into $a0
    la $a0, array

    # Load the index 'i' into $t0 from 'index'
    lw $t0, index

    # Add 4 times 'i' to the base address of 'array' to get the address of 'a[i]'
    sll $t1, $t0, 2
    add $a0, $a0, $t1

    # Load value at a[i] into register $t2
    lw $t2, 0($a0)

    # Load value at a[i+1] into register $t3
    lw $t3, 4($a0)

    # Compare a[i] with a[i+1]
    slt $t4, $t2, $t3   # Set $t4 to 1 if $t2 < $t3, otherwise 0

    # If a[i] < a[i+1], update a[i] with a[i-1]
    beqz $t4, skip_update   # Branch if $t4 is 0 (i.e., a[i] >= a[i+1])
    lw $t5, -4($a0)   # Load value at a[i-1] into register $t5
    sw $t5, 0($a0)   # Store value in $t5 into a[i]
    skip_update:

    # Load value at a[i] into register $a0 for printing
    lw $a0, 0($a0)

    # Print value at a[i]
    li $v0, 1   # System call code for printing an integer
    syscall

    # Terminate the program
    li $v0, 10   # System call code for exit
    syscall
