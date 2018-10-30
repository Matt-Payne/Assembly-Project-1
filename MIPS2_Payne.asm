.data
array: .word 14,12,13,5,9,11,3,6,7,10,2,4,8,1,31,51,41,71,21,61,91,81
space: .asciiz " "

.text
.globl main
main:
    addi $t8,$0,1
    la $t9,array        # saving for printing
    la  $t0, array      # save the base address to compare later
    add $t0, $t0, 88    # $t0 = starting address + 88 slots       
    addi $t5, $0, 0
    j outerLoop
    
innerLoop:                  # goes through entire array and sorts last element not sorted
    lw  $t2, 0($a0)         # sets $t2 to the current element in array
    lw  $t3, 4($a0)         # sets $t3 to the next element in array
    
    slt $t5, $t3, $t2       # $t5 = 1 if $t3 < $t2
    beq $t5, $0, checker   # if $t5 = 1, swap values
    add $t1, $0, 1          # need to add one to this if its 0, which is has to be here
    sw  $t2, 4($a0)         # store the higher number with offset 4
    sw  $t3, 0($a0)         # store the smaller number with no offset (before larger)

                                                
outerLoop:             # Moves to next iteration of inner loop
    add $t1, $0, $0     # set $t to 0 so its reset in innerloop
    la  $a0, array      # Set $a0 to the base address of the Array
    addi $t5,$t5,1       # add 1 to the counter
    j innerLoop
    


checker:
    addi $a0, $a0, 4            # move to next value in array
    bne  $a0, $t0, innerLoop    # check if array address is not 0 to zero to move into innerloop
    bne  $t1, $0, outerLoop    # check if checker value is 0, move into outerloop to go through again

print:
 lw $a0, 0($t9)
 addi $v0, $0,1
 syscall
 addi $t9, $t9,4
 li $a1,32  # 32 is ASCII for Space
 li $v0,11  # 11 is syscall for printing a char
 syscall 
 addi $t8,$t8,1
 bne $t8,21,print
 
