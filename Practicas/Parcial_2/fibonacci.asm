# Preparación: Crear la dirección de memoria de los datos y los datos.
.data

.text
lui $s0, 0x1001		# Dirección de A

main:
	addi $a0, $0, 6	# a0 contiene x, donde se quiere fibonacci en pos = x
	jal fib
	sw $v0, 0($s0)
	j endProgram


fib:
	# x <= 2
	slti $t2, $a0, 2	# t2 = 1, si a0 <= 1
	beq $t2, $zero, mayorUno
	add $v0, $v0, $a0
	jr $ra

	mayorUno:
	# Guardar parámetros
	addi $sp, $sp, -8	# Espacio para 2 elementos
	sw $a0, 0($sp)		# Guardar a0 actual
	sw $ra, 4($sp)		# Guardar ra actual

	# F(n - 1)
	addi $a0, $a0, -1
	jal fib
	
	# F(n - 2)
	addi $a0, $a0, -1
	jal fib

	# Recuperar parametros	
	lw $a0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8	# Restaurar sp
	
	jr $ra
	
endProgram: