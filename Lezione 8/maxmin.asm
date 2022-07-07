.text
.globl main
main:

#s0 = N
#s1 = i (del ciclo dello stack)
#s2 = max calcolato dalla funzione max
#s3 = min calcolato dalla funzione min
#t0 = numero letto dallo stack
#t1 = max/min fino ad ora

#input N
li $v0 5
syscall
move $s0 $v0

#ciclo che prende in input N numeri interi e li memorizza nello stack
li $s1 0	#contatore ciclo: i = 0
cicloInput:
li $v0 5	#codice per input syscall
syscall		#syscall input n: v0 = int
addi $sp $sp -4	#push per memorizzare in stack
sw $v0 ($sp)	#push per memorizzare in stack
addi $s1 $s1 1	#incremento contatore ciclo
blt $s1 $s0 cicloInput	# if i < N continua il ciclo

jal max
move $s2 $v0




max:
#ciclo che legge dallo stack N numeri interi
li $s1 0		#contatore ciclo: i = 0
leggiIntStack1: 	#legge tutti gli input messi nello stack
lw $t0 ($sp)		#pop: t0 = int
addi $sp $sp 4		#pop

#ble $t0 $t1 saltaScambio1  #se il numero non è maggiore (quindi è minore o uguale) non mette il valore in max
#move $t1 $t0		#ricorda il numero appena letto come max
#saltaScambio1:
move $t0 $a0
li $v0 1
syscall


addi $s1 $s1 1		#incremento contatore ciclo
blt $s1 $s0 leggiIntStack1	# if i < N continua il ciclo
move $v0 $t1		#metto come return della funzione il max
jr $ra






fine:
li $v0 10
syscall
