.data
array: .word 14,12,13,5,9,11,3,6,7,10,2,4,8,1,31,51,41,71,21,61,91,81
space: .asciiz " "

.text
.globl main
main:
    addi $t8,$0,1
    la $t9,array        # saving for printing
    la  $t0, array      # save the base address to compare later
    add $t0, $t0, 84    # $t0 = starting address + 84 slots    84/4   
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
 lw $a0, 0($t9) # load base address, then the next addresss each time
 addi $v0, $0,1 # op code for address
 syscall
 li $v0,4 #load op code to print string
 la $a0,space # load space
 syscall # print
 addi $t8,$t8,1 # add 1 to counter
 addi $t9, $t9,4 # add 4 to address 
 bne $t8,23,print # loop back around if not at end
 
