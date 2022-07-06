.data
erroreStr: .asciiz "Errore"

.text
.globl main
main:

#s0 = a
#s1 = b
#s2 = c
#s3 = z

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


condizione1:
bge $s0 $s1 condizione2
j errore #else

condizione2:
bnez $s2 condCorrette
j errore #else

condCorrette:
add $s3 $s0 $s1 #z = a+b
mul $s3 $s3 $s2	#z = c * (a+b)
li $v0 1	#codice per syscall print int
move $a0 $s3	#int da stampare
syscall		#syscall per stampare int
j fine

errore:
li $v0 4
la $a0 erroreStr
syscall

fine:
li $v0 10
syscall