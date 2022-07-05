.data
a:
.space 4
.space 4

.text
.globl main
main:

li $v0 5 	#codice syscall da fare (int input)
syscall		#syscall int input

la $t0 a 	#indirizzo array dove memorizzare

sw $v0 ($t0)	#memorizza primo int
move $a0 $v0	#metto l'int in a0 per stamparlo

li $v0 1	#codice syscall per stampare
syscall		#syscall stampa primo int

addi $v0 $a0 1	#sommo 1 ad intero

sw $v0 4($t0)	#memorizza secondo int
move $a0 $v0	#metto secondo int in a0 per stamparlo

li $v0 1	#codice syscall per stampare
syscall		#syscall stampa secondo int
