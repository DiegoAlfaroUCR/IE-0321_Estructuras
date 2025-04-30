# Preparación: Crear la dirección de memoria de los datos y los datos.
.data
A: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 # Primeras palabras en A

.text
lui $s0, 0x1001		# Dirección de A
addi $s1, $s0, 0xa0	# Dirección de B

add $t0, $0, $s0	# Ai
add $t1, $0, $s1	# Bi

start:
	# Ciclo par
	lw $t2, 0($t0)		# A[i]
	beq $t2, $0, end	# Finaliza en A[i] = 0
	
	lw $t2, 4($t0)		# A[i + 1]
	sw $t2, 0($t1)		# B[i] = A[i + 1]

	# Se incrementa hasta después del ciclo impar
	# Ciclo impar
	lw $t2, 0($t0)		# A[i - 1]
	sw $t2, 4($t1)		# B[i] = A[i - 1]
	
	addi $t0, $t0, 8	# Ai = Ai + 2 
	addi $t1, $t1, 8	# Bi = Bi + 2 
	
	j start
end:
