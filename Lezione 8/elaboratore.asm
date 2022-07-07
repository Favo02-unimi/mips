.text
.globl main
main:

#s0 = a
#s1 = b
#s2 = operatore
#s3 = risultato
#s4 = risultato (resto divisione)

#input a
li $v0 5
syscall
move $s0 $v0

#input b
li $v0 5
syscall
move $s1 $v0

#input operatore
li $v0 5
syscall
move $s2 $v0

#chiamata funzione
move $a0 $s0	#parametro 1 = a0 = a
move $a1 $s1	#parametro 2 = a1 = b
move $a2 $s2	#parametro 3 = a2 = operatore
jal Elaboratore	#funzione elaboratore

#risultato funzione
move $s3 $v0	#risultato
move $s4 $v1	#risultato 2 (resto divisione)

#stampa risultato
move $a0 $s3	#risultato da stampare
li $v0 1	#codice per stampare
syscall

#stampa resto divisione solo se divisione
li $t0 4	#registro per confrontare con 4 (cpd divisione)
beq $s2 $t0 printDivisione	#se l'operazione da fare era divisione

j fine	

#stampa resto divisione
#ci si arriva solo dal jump se l'operatore è divisione
printDivisione:
move $a0 $s4	#risultato da stampare
li $v0 1	#codice per stampare
syscall

j fine


Elaboratore:
#1 = +
#2 = -
#3 = *
#4 = /

#parametro 1 = a0 = a
#parametro 2 = a1 = b
#parametro 3 = a2 = operatore

li $t0 1		#verifica operatore = 1 = +
beq $a2 $t0 operPiu	#jump all'operazione +

li $t0 2		#verifica operatore = 2 = -
beq $a2 $t0 operMeno	#jump all'operazione -

li $t0 3		#verifica operatore = 3 = *
beq $a2 $t0 operMolt	#jump all'operazione *

li $t0 4		#verifica operatore = 4 = /
beq $a2 $t0 operDiv	#jump all'operazione /

j fine	#se non ha saltato in nessuna operazione errore: fine programma

fineFunzione:
jr $ra	#return al main

operPiu:
add $v0 $a0 $a1	#operazione +
j fineFunzione	#si va alla fine della funzione

operMeno:
sub $v0 $a0 $a1	#operazione -
j fineFunzione	#si va alla fine della funzione

operMolt:
mul $v0 $a0 $a1	#operazione *
j fineFunzione	#si va alla fine della funzione

operDiv:
div $a0 $a1	#operazione /
mflo $v0	#risultato divisione in return param 1
mfhi $v1	#resto divisione in return param 2
j fineFunzione	#si va alla fine della funzione

fine:
li $v0 10
syscall