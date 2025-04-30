# Preparación: Crear la dirección de memoria de los datos y los datos.
.data
A: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 # Primeras palabras en A

.text
lui $s0, 0x1001		# Dirección de A
.eqv N, 20		# Tamaño N

# Sumar numerador

add $t0, $0, $0		# i = 0
add $t1, $0, $0		# num = 0

for_sum:
	slti $t2, $t0, N	# i >= N
	beq $t2, $0, abs_1
	
	sll $t3, $t0, 2		# 4i
	add $t3, $t3, $s0	# 4i + A
	lw $t3, 0($t3)		# A[i]
	
	add $t1, $t1, $t3	# num += A[i]
	
	addi $t0, $t0, 1	# i++
	j for_sum
	
abs_1:	
	slt $t3, $t1, $0	# 0 si num > 0
	beq $t3, $0, dividir
	sub $t1, $0, $t1	# num = -num
	
dividir:
	add $v0, $0, $0		# Cociente = 0
	add $v1, $0, $t1	# Residuo = num
	
for_div:
	subi $t4, $v1, N	# Residuo - N
	slt $t5, $0, $t4	# 0 si Residuo < 0
	beq $t5, $0, abs_2
	
	add $v1, $t4, $0	# Residuo = Residuo - N
	addi $v0, $v0, 1	# Cociente ++
	
	j for_div

abs_2:
	beq $t3, $0, end
	sub $v1, $0, $v1	# Residuo = -Residuo
end: