.text
.globl main
main:

li $v0 5 	#codice syscall da fare (int input)
syscall		#syscall int input
	
addi $a0 $v0 1	#sommare int letto con 1

li $v0 1	#codice syscall da fare (int output)
syscall		#syscall int output
