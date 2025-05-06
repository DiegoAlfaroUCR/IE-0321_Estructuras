# Preparación: Crear la dirección de memoria de los datos y los datos.
.data
A: .word 3, 5, 8, 10, 15, 6, 5, 1, 2, 7, -1 # Primeras palabras en A

.text
lui $s0, 0x1001		# Dirección de A

main:
	jal bubble
	j endProgram

# Bubble sort
bubble:
	addi $t0, $0, 0		# Bandera de swap, 0 si no hay swap
	add $t1, $0, $s0	# i = dir(A[0])
	
	loop:
		lw $t2, 4($t1)		# A[i + 1]
		beq $t2, $0, endLoop 	# Final de array si encuentra 0
		
		lw $t3, 0($t1)		# A[i]
		
		slt $t4, $t3, $t2
		bne $t4, $0, noSwap	# A[i] < A[i + 1] -> no hay swap
		beq $t3, $t2, noSwap	# A[i] = A[i + 1] -> no hay swap
		
		sw $t2, 0($t1)		# A[i + 1] -> dir(A[i])
		sw $t3, 4($t1)		# A[i] -> dir(A[i + 1])
		addi $t0, $0, 1		# Bandera se pone en 1
		
		noSwap:
		addi $t1, $t1, 4	# i++
		j loop
	
	endLoop:
		bne $t0, $0, bubble
		jr $ra

endProgram: