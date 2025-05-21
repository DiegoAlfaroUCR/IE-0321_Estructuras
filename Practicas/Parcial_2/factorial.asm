# Preparación: Crear la dirección de memoria de los datos y los datos.
.data

.text
lui $s0, 0x1001		# Dirección de A

main:
	addi $a0, $0, 5		# a0 contiene x, donde se quiere x!
	jal fact		# Llamar factorial
	sw $v0, 0($s0)		# Guardar factorial en memoria
	j endProgram

fact:
	slti $t0, $a0, 2	# t0 = 1, si a0 <= 1
	beq $t0, $zero, mayorUno
	addi $v0, $zero, 1	# v0 = 1
	jr $ra
	
	mayorUno:
	# Guardar en el stack
	addi $sp, $sp, -8
	sw $a0, 0($sp)
	sw $ra, 4($sp)
	
	add $a0, $a0, -1
	jal fact
	
	lw $a0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	
	mul $v0, $v0, $a0
	
	jr $ra

endProgram: