# Preparación: Crear la dirección de memoria de los datos y los datos.
.data
A: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 # Primeras palabras en A

.text
lui $s0, 0x1001		# Dirección de A

# Práctica 5
addi $s1, $zero, 20	# Tamaño del array (N)

lw $v0, 0($s0)		# max = A[0]
lw $v1, 0($s0)		# min = A[0]

addi $t0, $s0, 4	# i = 4 + A
sll $t1, $s1, 2		# t0 = 4N
add $t1, $t1, $s0	# t0 = 4N + A

for:
    sltu $t2, $t0, $t1
    beq $t2, $0, endFor # Condición de final de ciclo for
    
    lw $t3, 0($t0)	  # t2 = A[i]
    
    slt $t2, $v0, $t3
    beq $t2, $0, min
    add $v0, $t3, $0
    
    min:
    slt $t2, $t3, $v1
    beq $t2, $0, inc
    add $v1, $t3, $0
    
    inc:    
    addi $t0, $t0, 4	  # i += 4
    j for

endFor:
  