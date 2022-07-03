.text
.globl main
main:
li $t0 45 	#inizializzo 45
li $t1 100	#inizializzo 100

#moltiplicazione in 2 passaggi: il risultato finisce il hi e lo
mult $t0 $t1	#moltiplico 45 e 100 (finiscono automaticamente in hi e lo)
mflo $s0	#muovo da low in s0 il risultato

#moltiplicazione in un passaggio: una pseudo istruzione
mul $s1 $t0 $t1	#s1 = t0 * t1

#divisione in 2 passaggi: il risultato va in lo e il resto in hi
div $t1 $t0	
mflo $s2	#s3 = resto divisione
mfhi $s3	#s2 = risultato divisione

