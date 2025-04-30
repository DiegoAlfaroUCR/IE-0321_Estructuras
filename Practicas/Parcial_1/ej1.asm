# Preparación: Crear los registros a usar
.text
add $t0, $zero, $zero 		# Crear $t0 como 0
lui $t1, 0xFFFF		    	# Crear $t1 como FFFF FFFF
addi $t1, $t1, 0xFFFF 

# Ejercicio 1
lui $t4, 0x5555 	    	# 0101 0101 0101 0101 ...
addi $t4, $t4, 0x5555		# ... 0101 0101 0101 0101

and $t5, $t4, $t1	    	# 0Y0Y 0Y0Y ...

sll $t4, $t4, 1		    	# 1010 1010 
and $t6, $t4, $t0	    	# X0X0 X0X0 ...

add $t3, $t5, $t6

