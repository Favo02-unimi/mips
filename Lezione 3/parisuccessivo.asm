.text
.globl main
main:

#input int
li $v0 5
syscall
move $s0 $v0

ciclo:
addi $s0 $s0 1	#aggiungo 1 per andare al successivo

li $t0 2
div $s0 $t0 	#divido per 2 per verificare parita'
mfhi $s1	#metto in s1 da hi il resto della divisione

beqz $s1 fineCiclo	#se resto = 0 allora fine ciclo

j ciclo		#se non uscito dal ciclo torno ad aggiungere 1

fineCiclo:
move $a0 $s0	#metto int da stampare in a0
li $v0 1	#codice per stampare
syscall		#syscall per stampare int

fine:
li $v0 10
syscall