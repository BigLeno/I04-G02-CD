vsim work.mux6x1_10b

# Configurando as entradas
force -freeze /mux6x1_10b/C1 0000000001
force -freeze /mux6x1_10b/C2 0000000101
force -freeze /mux6x1_10b/C3 0000001010
force -freeze /mux6x1_10b/C4 0000011001
force -freeze /mux6x1_10b/C5 0000110010
force -freeze /mux6x1_10b/C6 0001100100

# Adicionando sinais à visualização de ondas
add wave /mux6x1_10b/C1
add wave /mux6x1_10b/C2
add wave /mux6x1_10b/C3
add wave /mux6x1_10b/C4
add wave /mux6x1_10b/C5
add wave /mux6x1_10b/C6
add wave /mux6x1_10b/seletor_mux6x1_10b
add wave /mux6x1_10b/saida_mux6x1_10b

# Iniciando a simulação
run 0 ns

# Simulando diferentes valores do seletor
force -freeze /mux6x1_10b/seletor_mux6x1_10b 000
run 10 ns
force -freeze /mux6x1_10b/seletor_mux6x1_10b 001
run 10 ns
force -freeze /mux6x1_10b/seletor_mux6x1_10b 010
run 10 ns
force -freeze /mux6x1_10b/seletor_mux6x1_10b 011
run 10 ns
force -freeze /mux6x1_10b/seletor_mux6x1_10b 100
run 10 ns
force -freeze /mux6x1_10b/seletor_mux6x1_10b 101
run 10 ns
force -freeze /mux6x1_10b/seletor_mux6x1_10b 110
run 10 ns
force -freeze /mux6x1_10b/seletor_mux6x1_10b 111
run 10 ns

# Finalizando a simulação
run 10 ns
