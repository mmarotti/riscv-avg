.data
array:  .float 1.2, 3.4, 5.6, 7.8, 10.2 # Números do array
size:   .word 5 # Tamanho do array

.text
_start:
    la t0, array # Endereço do primeiro elemento do array
    lw t1, size # Tamanho do array
    li t3, 0 # Índice
    
    fmv.w.x f0, zero # Acumulador

loop:
    beq t3, t1, end # Se contador == |array|, retorna
    flw f1, 0(t0) # Carrega o valor flutuante atual de t0 para f1
    fadd.s f0, f0, f1 # Adiciona o valor ao acumulador f0
    addi t0, t0, 4 # Move para o próximo elemento do array
    addi t3, t3, 1 # Incrementa o contador de índices
    j loop         # Volta para o loop

end:
    fcvt.s.w  f1, t1 # Converte inteiro para float, necessário para divisão
    fdiv.s  f0, f0, f1 # Divide a soma pelo número de elementos
