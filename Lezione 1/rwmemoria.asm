.data
A: .space 400
B:
	.space 12
	10
	.space 384
C: .word 2
i: .word 3

.text
.globl main
main:

# A[99] = 5 + B[i] + C

la $t0 A
la $t1 B
la $t2 C
la $t3 i

lw $s3 ($t3) #lettura i
sll $t4 $s3 2	#molitplicato indice i per 4
add $t1 $t1 $t4	#andato da B a B[i]
lw $s1 ($t1) #lettura B[i]

lw $s2 ($t2) #lettura C

addi $s4 $s1 5
add $s4 $s4 $s2

sw $s4 396($t0)


# t0 = indirizzo A
# t1 = indirizzo B
# t2 = indirizzo C
# t3 = indirizzo i
# t4 = i moltiplicato per 4 per poter leggere []

# s1 = B[i]
# s2 = C
# s3 = i
# s4 = somma
