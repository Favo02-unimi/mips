.data
array: .word 1 2 3 4 5 6 7 8 9 10 11 12 13
cErroreStr: .asciiz "Comando non riconosciuto"

.globl main
.text
main:

#s0 = a
#s1 = b
#s2 = c
#s3 = indice array
#t0 = indice a
#t1 = indice b
#t2 = indice elemento a-esimo
#t3 = indice elemento b-esimo
#t4 = elemento a-esimo
#t5 = elemento b-esimo
#t6 = temp per confrontare beq 1 e -1


#input int a
li $v0 5
syscall
move $s0 $v0

#input int b
li $v0 5
syscall
move $s1 $v0

#input int c
li $v0 5
syscall
move $s2 $v0

la $s3 array 	#indirizzo array
sll $t0 $s0 2	#indice a-esimo
sll $t1 $s1 2	#indice b-esimo
add $t2 $s3 $t0	#indirizzo elemento a-esimo
lw $t4 ($t2)	#elemento a-esimo
add $t3 $s3 $t1	#indirizzo elemento b-esimo
lw $t5 ($t3)	#elemento b-esimo


beqz $s2 cZero	#c == 0
li $t6 1
beq $s2 $t6 cUno  #c == 1
li $t6 -1
beq $s2 $t6 cMenoUno  #c == 1
j cErrore

cZero:
sw $t5 ($t2)	#a-esimo = b-esimo
sw $t4 ($t3)	#b-esimo = a-esimo
j fine

cUno:
sw $t4 ($t3)
j fine

cMenoUno:
sw $t5 ($t2)
j fine

cErrore:
li $v0 4
la $a0 cErroreStr
syscall

fine:
li $v0 10
syscall