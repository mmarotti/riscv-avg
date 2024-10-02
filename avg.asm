.data
sizeMessage:  .asciz "\nQual o tamanho do array? "
elementsMessage:  .asciz "Insira um elemento do array: "

.text
li t0, 0 # Índice
fmv.w.x ft0, zero # Acumulador

li a7, 4 # (4 = print string)
la a0, sizeMessage
ecall # call print string

li a7, 5 # (5 = read int)
ecall # call read int
    
mv t1, a0 # Armazenando tamanho do array
  
loop:
    beq t0, t1, end # Se contador == |array|, finaliza loop
 
    li a7, 4 # (4 = print string)
    la a0, elementsMessage
    ecall

    li a7, 6 # (6 = read float)
    ecall
    
    fadd.s ft0, ft0, fa0 # Adiciona float lido ao acumulador
    addi t0, t0, 1 # Incrementa índice

    j loop # Volta para o loop

end:
    fcvt.s.w  ft1, t1 # Converte inteiro para float, necessário para divisão
    fdiv.s  ft0, ft0, ft1 # Divide a soma pelo número de elementos
    
    li a7, 2 # (2 = print float)
    fmv.s fa0, ft0
    ecall 
   
    li a7, 10 # Encerra o programa com código 0 (10 = exit)
    ecall
