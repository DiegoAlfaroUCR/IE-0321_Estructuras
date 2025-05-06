# Preparación: Crear la dirección de memoria de los datos y los datos.
.data

.text
lui $s0, 0x1001		# Dirección de A

main:
	addi $a0, $0, 12	# a0 contiene x, donde se quiere x!
	jal fact		# Llamar factorial
	sw $v0, 0($s0)		# Guardar factorial en memoria
	j endProgram

fact:
	slti $t0, $a0, 1	# x < 1, termina cadena
	beq $t0, $0, seguirFact
	addi $v0, $0, 1		# v0 = 1
	jr $ra

seguirFact:
	addi $sp, $sp, -8	# Pedir espacio de 2 elementos en la pila
	sw $a0, 0($sp)		# Guardar x actual en stack
	sw $ra, 4($sp)		# Guardar ra en stack

	addi $a0, $a0, -1	# x--
	jal fact

	lw $t1, 0($sp)		# valor de x previo
	lw $t2, 4($sp)		# ra previo
	addi $sp, $sp, 8	# Pop de 2 elementos

	mul $v0, $v0, $t1	# v0 = v0_prev * v0
	add $ra, $t2, $0	# ra = t2

	jr $ra			# Retornar a llamado

endProgram: