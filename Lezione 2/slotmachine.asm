.data
inputMsg: .asciiz "Inserire intero: "
output: .ascii "Credito rimanente: "

.text
.globl main
main:

#s0 = NUM
#s1 = R
#s2 = RESULT

#int input dialog
li $v0 51	#codice per input int
la $a0 inputMsg	#stringa input
syscall		#syscall per input int dialog
move $s0 $a0	#memorizzo int inserito in s0

#numero random [-NUM, NUM]
sll $a1 $s0 1	#moltiplico num per 2 per poter generare da -num a num
li $v0 42	#codice per syscall int random range
li $a0 25	#seed generatore casuale
syscall		#syscall per generare random int
sub $s1 $a0 $s0	#sottraggo il num dal numero generato per simulare generazione da -num a num

#RESULT = NUM + R
add $s2 $s0 $s1

#dialog output
li $v0 56	#codice per syscall output int
la $a0 output	#testo della syscall
move $a1 $s2	#int della syscall
syscall		#syscall output dialog int



