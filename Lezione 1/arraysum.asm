.data
A: .word 39 12 3 18 21 3 0xBAD 123 92 2 33 23 48 3

h: .word 20

.text
.globl main
main:

la $t1 A #carico indirizzo di A
lw $s0 32($t1) #leggo parola A[8]

la $t2 h #carico indirizzo di h
lw $s1 ($t2) #leggo parola h

add $s2 $s0 $s1 

sw $s2 48($t1)



# t1 = indirizzo A
# t2 = indirizzo h
# s0 = parola A[8]
# s1 = h
# s2 = A[8] + h