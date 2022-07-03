# A[c-1] = c*(B[A[c]] + c) / A[2*c-1]		2 * 8 / 4 = 4
.data
A:
-1 -1 1 4
B:
-1 6 -1 -1
C:
2

.text
.globl main
main:

#t0 = ind A
#t1 = ind B
#t2 = ind c
#t3 = c shiftato di 4 per indice
#t4 = operazioni su c per ricavare A[2*c-1]

#s0 = un elemento di A (quello che mi serve in quel momento)
#s1 = un elemento di B (quello che mi serve in quel momento)
#s2 = c

#s3 = risultato (parziale)
#s4 = risultato finale (spostato da lo)

la $t0 A
la $t1 B
la $t2 C

lw $s2 ($t2) 		#leggo c

sll $t3 $s2 2 		#shift c per indici
add $s0 $t0 $t3 	#sommo A + indice c per A[c]

lw $s0 ($s0) 		#leggo A[c]

sll $s0 $s0 2		#molitplico A[c] * 4 per renderlo indice
add $s1 $t1 $s0		#sommo per arrivare ad A[c]

lw $s1 ($s1) 		#leggo B[A[c]]

add $s3 $s1 $s2		#sommo B[A[c]] + c = 8

mul $s3 $s3 $s2		#moltiplico c * (B[A[c]] + c) = 16

sll $t4 $s2 1		#moltiplico c per 2 per A[2*c-1] = 4

addi $t4 $t4 -1		#sottraggo 1 per A[2*c-1] = 3

sll $t4 $t4 2		#molitplico per 4 per ricavare indice
add $s0 $t0 $t4		#sommo per arrivare ad indice A[2*c-1]

lw $s0 ($s0)		#leggo A[2*c-1]

div $s3 $s0		#divido c*(B[A[c]] + c) con A[2*c-1] = 4

addi $t4 $s2 -1		#calcolo c-1 per A[c-1]

sll $t4 $t4 2		#moltiplico per 4 e sommo per indice per A[c-1]
add $t4 $t4 $t0		#sommo per arrivare all'indice di A[c-1]

mflo $s4		#muovo il risultato da lo in s4

sw $s4 ($t4)		#scrivo risultato in A[c-1]
