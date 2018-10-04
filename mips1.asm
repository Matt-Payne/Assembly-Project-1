.text # code begins	
la $t0, 268501024 # load first base address
li $t1, 100 # load immediate 100 into register t1

sw $t1, 32($t0) # store word 100 at the first address
	# A[0] 0th element in array
	
.text
.global main

main:
#initialize var
li $ t0,0
li $t4,-1
li $t3,0
la $a0,scores

get_score:
lw $t2,0($a0) # load the first score into t2
beq $t2,$t4,stop #t2 = scores[0] 
slti $t3,$t2,0 # set less than immediate, store t3 = 1 if t2 < 0
bne $t3,$zero,get_score #if t3 != 0 get other score
slti $t3,$t2,101 # set less than immediate, store t3 = 1 if t2 <101
beq $t3,$zero,get_score # goto get score if t3 = 0
add $t1,$t1,$t2 # add up the scores
addi $t0,$t0,1 # i++ must be addi bc you're adding a constant
j get_score # get another score




stop:
li $v0,4 # load op code to print string
la $a0,avgstr # load address of string 
syscal\ #print
div $t1,$t0 # divide with lo and hi 
mflo $a0 #move the quotient from lo to a pointer
move $a1,$a0 # saving quotient in a1
li $v0,1 #load code to print the num
syscall
li $v0,4
la $a0,remstr
mfhi $a0
move $a2,$a0
li $v0,1
syscall
j end

end nop

 
