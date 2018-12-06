.text 
.globl main

main:
li $t7,97 # a to compare
li $t6,98 # b to compare
la $a0,askstr1 # grab floating number
li $v0,4
syscall

li $v0,12 #reads in char, 97 for a 98 for b
syscall #print

move $t0,$v0

li $v0,4
la $a0, newline #new line
syscall


li $v0,4
la $a0,askstr2 # grab floating number
syscall #print

li $v0,6
syscall #print 
mov.s $f4,$f0 #move first number into floating reg

beq $t0,$t6,conC
j convF


convF: #from F to C
l.s $f1,c1
l.s $f2, c2
l.s $f11,oneH
l.s $f10,oneE
div.s $f9,$f11,$f10
sub.s $f0,$f0,$f1
mul.s $f3,$f0,$f9
mov.s $f12,$f3
li $v0, 2
syscall
l.s $f31, coldF
l.s $f30,hotF
c.lt.s $f4,$f31
bc1t printCold

c.lt.s $f30,$f4
bc1t printHot


j finish

conC: #from C to F
l.s $f1, c1 # Load Floating Point Single conversion factor 1
l.s $f2, c2 # Load Floating Point Single conversion factor 2
mul.s $f3, $f0, $f2 # C*180/100
add.s $f3, $f3, $f1 # F = 32 + C*180/100
mov.s $f12, $f3 # Copy $f3 to $f12
li $v0, 2 # Load 2 = print_float into $v0
syscall # print value in $f12
l.s $f31, coldF
l.s $f30,hotF
c.lt.s $f3,$f31
bc1t printCold

c.lt.s $f30,$f3
bc1t printHot

j finish



printCold:
la $a0,coldstr # grab floating number
li $v0,4
syscall
j finish

printHot:
la $a0, hotstr
li $v0,4
syscall

finish:
li $t7,121 # y to compare
li $t6,110 # b to compare
la $a0,redostr #ask for another run
li $v0,4
syscall

li $v0,12 #reads in char, 97 for a 98 for b
syscall #print


.data
askstr1: .asciiz "a. Convert Fahrenheit to Celsius, or b. Convert Celsius to Fahrenheit."
askstr2: .asciiz "Enter a floating temperature "
coldstr: .asciiz "\nThat is COLD "
hotstr: .asciiz "\nThat is HOT "
redostr .asciiz "\n Do you like to do another conversion? Y for yes N for no"
hotF: .float 119
newline: .asciiz "\n"
c1: .float 32 # conversion factor 1
c2: .float 1.8 # conversion factor 2
coldF: .float 1.0 # cutoff for "cold" temperature
oneH: .float 100.0
oneE: .float 180.0
# y is 121
# n is 110

