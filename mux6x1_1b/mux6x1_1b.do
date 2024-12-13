vsim work.mux6x1_1b
add wave -position insertpoint sim:/mux6x1_1b/entrada_mux6x1_1b
add wave -position insertpoint sim:/mux6x1_1b/seletor_mux6x1_1b
add wave -position insertpoint sim:/mux6x1_1b/saida_mux6x1_1b

force -freeze sim:/mux6x1_1b/entrada_mux6x1_1b 010101 0

# Testando valores do seletor de 000 a 111
force -freeze sim:/mux6x1_1b/seletor_mux6x1_1b 000 0
run 10 ns
force -freeze sim:/mux6x1_1b/seletor_mux6x1_1b 001 0
run 10 ns
force -freeze sim:/mux6x1_1b/seletor_mux6x1_1b 010 0
run 10 ns
force -freeze sim:/mux6x1_1b/seletor_mux6x1_1b 011 0
run 10 ns
force -freeze sim:/mux6x1_1b/seletor_mux6x1_1b 100 0
run 10 ns
force -freeze sim:/mux6x1_1b/seletor_mux6x1_1b 101 0
run 10 ns
force -freeze sim:/mux6x1_1b/seletor_mux6x1_1b 110 0
run 10 ns
force -freeze sim:/mux6x1_1b/seletor_mux6x1_1b 111 0
run 10 ns