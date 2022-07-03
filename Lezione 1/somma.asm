.text
.globl main
main:
li $s1 5 #carica l'immediato 5 nel registro $s1 		$s1 = 5
li $s2 7 #carica l'immediato 7 nel registro $s2			$s2 = 7
add $s0 $s1 $s2 #somma s1 e s2 in s0				$s0 = $s1 + $s2