.text 
.globl main


main:
li $v0,4
la $a0,askstr1 # grab floating number
syscall

li $v0,6
syscall
mov.s $f2,$f0


li $v0,4
la $a0,askstr2 # grab floating number
syscall

li $v0,6
syscall
mov.s $f4,$f0

add.s $f12,$f2,$f4

li $v0,4
la $a0, sumstr
syscall

li $v0,2
syscall

li $v0,4
la $a0, newline
syscall

li $v0,4
la $a0, substr
syscall

sub.s $f12,$f2,$f4

li $v0,2
syscall

li $v0,4
la $a0, newline
syscall

li $v0,4
la $a0, multstr
syscall

mul.s $f12,$f2,$f4
    
li $v0,2
syscall

li $v0,4
la $a0, newline
syscall

li $v0,4
la $a0, divstr
syscall


div.s $f12,$f2,$f4

li $v0,2
syscall

li $v0,4
la $a0, newline
syscall

li $v0,4
la $a0,anothercalc # grab floating number
syscall

li $v0,5
syscall
addi $t1,$0,1

beq $t1,$v0,main


.data
askstr1: .asciiz "Enter a floating number."
askstr2: .asciiz "Enter another floating number."
sumstr: .asciiz "\nTheir sum is : "
substr: .asciiz "Subtracted : "
multstr: .asciiz "Mult of numbers : "
divstr: .asciiz "Divided the numbers : "
anothercalc: .asciiz "\Another calculation? Press 1 for yes and 2 to exit "
newline: .asciiz "\n"
