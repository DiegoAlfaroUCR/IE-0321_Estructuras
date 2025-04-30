# Preparación: Crear la dirección de memoria de los datos y los datos.
.data
A: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 # Primeras palabras en A

.text
lui $s0, 0x1001		# Dirección de A

# Ejercicio 2
addi $t0, $0, 1		# i = 1
addi $t1, $0, 129	# i <= 129

for:
	sltu $t2, $t0, $t1	# i >= 129 
	beq $t2, $0, endFor
	
	sll $t3, $t0, 2		# 4i
	add $t3, $t3, $s0	# 4i + A
	
	lw $t4, -4($t3)		# A[i-1]
	lw $t5, 4($t3)		# A[i+1]
	
	add $t6, $t4, $t5	# A[i-1] + A[i+1]
	sw $t6, 0($t3)
	
	sll $t0, $t0, 1		# i = 2i
	
	j for
endFor: