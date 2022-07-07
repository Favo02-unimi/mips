.text
.globl main
main:

#s0 = N
#t0 = contatore ciclo
#t1 = numero estratto dallo stack


#input N
	li $v0 5
	syscall
	move $s0 $v0

#ciclo per prendere in input N numeri interi (memorizzati nello stack)
	li $t0 0 	#i = 0 (contatore ciclo)
	cicloInputInteri:

	li $v0 5	#codice per syscall input int
	syscall		#syscall per input intero

	addi $sp $sp -4	#push
	sw $v0 ($sp)	#push nello stack dell'intero letto

	addi $t0 $t0 1	#i++

	blt $t0 $s0 cicloInputInteri	#i < N allora continua ciclo


jal max
j fine





#procedura che legge un intero alla volta dallo stack e ne stabilisce il max
	max:
	li $t0 0	#i = 0 (contatore interi estratti dallo stack)
	cicloEstraiDalloStackMax:
	lw $t1 ($sp)	#pop dallo stack (t1 = intero)
	addi $sp $sp 4	#pop
	
	li $v0 1
	move $a0 $t1
	syscall
	
	blt $t0 $s0 cicloEstraiDalloStackMax #i < N allora continua a prendere dallo stack
	
	jr $ra




fine:
li $v0 10
syscall

