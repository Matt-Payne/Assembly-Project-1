.text

.globl main

main:
la $t0, 268501024 # load first base address 10010020
li $t1, 100 # load immediate 100 into register t1

sw $t1, 8($t0)


la $t0, 268501056 #10010040
li $t1, 13

sw $t1, 4($t0)

la $t0, 268501056 #10010040
li $t1, 15

sw $t1, 20($t0)

la $t0, 268501088 #10010060
li $t1, -1

sw $t1, 4($t0)




