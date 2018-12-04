.text 
.globl main


main:
li $v0,4
la $a0,askstr1 # grab floating number
syscall

li $v0,6
syscall #print
mov.s $f2,$f0 #move into floating reg


li $v0,4
la $a0,askstr2 # grab floating number
syscall #print

li $v0,6
syscall #print 
mov.s $f4,$f0 #move second number into floating reg

add.s $f12,$f2,$f4 # add them

li $v0,4
la $a0, sumstr # prints result in f12
syscall #print

li $v0,2
syscall #print

li $v0,4
la $a0, newline
syscall #print

li $v0,4
la $a0, substr #sub text 
syscall #print

sub.s $f12,$f2,$f4 # sub

li $v0,2 #prints result in f12
syscall #print

li $v0,4
la $a0, newline
syscall #print

li $v0,4
la $a0, multstr #print mult statement
syscall

mul.s $f12,$f2,$f4 #multiply them
    
li $v0,2
syscall #print from f12

li $v0,4
la $a0, newline
syscall

li $v0,4
la $a0, divstr #divide text
syscall


div.s $f12,$f2,$f4 #divide numbers, no need for lo and hi

li $v0,2 #print divded number
syscall

li $v0,4
la $a0, newline #new line
syscall

li $v0,4
la $a0,anothercalc # grab in to run again
syscall

li $v0,5 
syscall
addi $t1,$0,1 # put 1 in t1 to make sure it loops

beq $t1,$v0,main #loop to beginning if number is what you're looking for



.data
askstr1: .asciiz "Enter a floating number."
askstr2: .asciiz "Enter another floating number."
sumstr: .asciiz "\nTheir sum is : "
substr: .asciiz "Subtracted : "
multstr: .asciiz "Mult of numbers : "
divstr: .asciiz "Divided the numbers : "
anothercalc: .asciiz "\Another calculation? Press 1 for yes and 2 to exit "
newline: .asciiz "\n"
