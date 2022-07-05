# calcoli la somma dei primi tre numeri interi positivi (1, 2 e 3), ciascuno moltiplicato per 3;
# non si utilizzi la pseudo-istruzione mul.
# solo #s0 e t0

.text
.globl main
main:

li $t0 1		#t0 = 1
add $s0 $t0 $t0	#s0 = 1 + 1
add $s0 $s0 $t0	#s0 = (1 + 1) + 1

add $sp $sp -4		#push
sw $s0 ($sp)		#stack: 3x1

li $t0 2		#t0 = 2
add $s0 $t0 $t0	#s0 = 2 + 2
add $s0 $s0 $t0	#s0 = (2 + 2) + 2

add $sp $sp -4		#push
sw $s0 ($sp)		#stack: 3x1 | 3x2

li $t0 3		#t0 = 3
add $s0 $t0 $t0	#s0 = 3 + 3
add $s0 $s0 $t0	#s0 = (3 + 3) + 3

#somma totale: 3x3 ($s0) + 2x3 (stack 1) + 1x3 (stack 2)
lw $t0 ($sp)		#t0 = 2x3
add $sp $sp 4		#pop - stack: 3x1

add $s0 $s0 $t0		#$s0 = 3x3 + 2x3

lw $t0 ($sp)		#t0 = 1x3
add $sp $sp 4		#pop - stack: vuoto

add $s0 $s0 $t0		#$s0 = 3x3 + 2x3 + 1x3