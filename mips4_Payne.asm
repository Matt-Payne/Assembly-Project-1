.text 
.globl main

main:

li $v0,4
la $a0,askstr1 # grab floating number
syscall

li $v0,12
syscall #print

li $v0,4
la $a0, newline #new line
syscall


li $v0,4
la $a0,askstr2 # grab floating number
syscall #print

li $v0,6
syscall #print 
mov.s $f4,$f0 #move first number into floating reg





convF:
l.s $f1,c1
l.s $f2, c2
sub.s $f0,$f0,$f1
mul.s $f3,$f0,$f2
mov.s $f12,$f3
li $v0, 2
syscall

conC #from C to F
l.s $f1, c1 # Load Floating Point Single conversion factor 1
l.s $f2, c2 # Load Floating Point Single conversion factor 2
mul.s $f3, $f0, $f2 # C*180/100
add.s $f3, $f3, $f1 # F = 32 + C*180/100
mov.s $f12, $f3 # Copy $f3 to $f12
li $v0, 2 # Load 2 = print_float into $v0
syscall # print value in $f12


.data
askstr1: .asciiz "a. Convert Fahrenheit to Celsius, or b. Convert Celsius to Fahrenheit."
askstr2: .asciiz "Enter a floating temperature "
sumstr: .asciiz "\nTheir sum is : "
newline: .asciiz "\n"
c1: .float 32 # conversion factor 1
c2: .float 1.8 # conversion factor 2
c3: .float 0.0 # cutoff for "cold" temperature


