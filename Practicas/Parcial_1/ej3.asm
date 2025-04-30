# Preparación: Crear la dirección de memoria de los datos y los datos.
.data
A: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 # Primeras palabras en A

.text
lui $s0, 0x1001		# Dirección de A

# Ejercicio 3
add $t0, $0, $0		# i = 0

while:
	sll $t1, $t0, 2		# 4i, se guarda para uso posterior
	sll $t2, $t1, 1		# 4(2i)
	add $t2, $t2, $s0	# 4(2i) + A
	
	lw $t3, 0($t2)		# A[2i]
	beq $t3, $0, endWhile	# A[2i] = 0
	
	lw $t4, -4($t2)		# A[2i - 1]
	lw $t5, 4($t2)		# A[2i + 1]
	add $t5, $t5, $t4	# A[2i - 1] + A[2i + 1]
	
	add $t1, $t1, $s0	# 4I + A
	sw $t5, 0($t1)		# t5 -> A[i]
	
	addi $t0, $t0, 1	# i++
	j while
	
endWhile:
	