# Preparación: Crear la dirección de memoria de los datos y los datos.
.data
A: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 # Primeras palabras en A

.text
lui $s0, 0x1001		# Dirección de A

# Práctica 5
addi $s1, $zero, 20	# Tamaño del array (N)

lw $v0, 0($s0)		# max = A[0]
lw $v1, 0($s0)		# min = A[0]

sll $t0, $s1, 2		# t0 = 4N
add $t0, $t0, $s0	# t0 = 4N + A

addi $t1, $s0, 4	# i = 4 + A

for:
    beq $t0, $t1, endFor # Condición de final de ciclo for
    lw $t2, 0($t1)	  # t2 = A[i]
    
    addi $t1, $t1, 4	  # i += 4
    
    slt $t3, $t2, $v0    # t3 = 0 if t2 > max
    beq $t3, $zero, max
    
    slt $t3, $v1, $t2    # t3 = 0 if t2 < min
    beq $t3, $zero, min
    
    j for

max:
    add $v0, $zero, $t2
    j for

min:
    add $v1, $zero, $t2
    j for

endFor:
  
