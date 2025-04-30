# Preparación: Crear la dirección de memoria de los datos y los datos.
.data
A: .word 1, -2, 3, -4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 # Primeras palabras en A

.text
lui $s0, 0x1001		# Dirección de A

# Ejercicio 4
add $t0, $0, $0 	# i = 0
addi $t1, $0, 10	# i < 10

for:
	beq $t0, $t1, endFor	# i = 10
	
	sll $t2, $t0, 2		# 4i
	add $t2, $t2, $s0	# 4i + A
	lw $t3, 0($t2)		# A[i]
	
	add $t0, $t0, 1		# i++
	
	# if(A[i] < 0)
	slt $t4, $0, $t3
	beq $t4, $0, if_1
	
	cont_for:
	# if(i + 1 < 10)
	slt $t4, $t1, $t0
	beq $t4, $0, if_2
	
	j for

if_1:
	sub $t5, $0, $t3	# A[i] = -A[i]
	sw $t5, 0($t2)
	j cont_for

if_2:
	lw $t5, 4($t2)		# A[i + 1]
	sll $t5, $t5, 1		# 2A[i + 1]
	add $t5, $t5, $t3	# A[i] + 2A[i + 1]
	sw $t5, 0($t2)
	j for

endFor: