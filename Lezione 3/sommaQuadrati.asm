.data
breakStr: .asciiz "Break"
.text
.globl main
main:

#s0 = v
#s1 = n
#s2 = sum
#t0 = i

#input int v
li $v0 5
syscall
move $s0 $v0

#input int n
li $v0 5
syscall
move $s1 $v0

move $s2 $s0	#inizializzazione sum = v

li $t0 1	#inizializzazione i = 1
for:
bge $t0 $s1 fineFor	#condizione di uscita dal for


#condizione if
mul $t1 $t0 $t0	#t1 = i * i
div $t1 $s0	#Hi = (i*i)%V 
mfhi $t2	#t2 = (i*i)%V
beqz $t2 breakFor	#salto se (i*i)%V == 0

add $s2 $s2 $t1 #sum += i * i
addi $t0 $t0 1	#incremento i++
j for

breakFor:
li $v0 4
la $a0 breakStr
syscall

fineFor:
li $v0 1	#codice per syscall print int
move $a0 $s2	#int da stampare sum
syscall		#syscall per stampare sum

fine:
li $v0 10
syscall
