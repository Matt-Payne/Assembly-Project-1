.text

.global main

main:
la $t0, 268501024 # load first base address
li $t1, 64 # load immediate 100 into register t1

sw $t1, 32($t0)

la $t0, 268501056
li $t1, 00000000d

sw $t1, 16($t0)

la $t0, 268501056
li $t1, 00000000f

sw $t1, 16($t0)

la $t0, 268501088
li $t1, fffffffff

sw $t1, 64($t0)




