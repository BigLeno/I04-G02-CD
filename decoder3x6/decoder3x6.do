vsim work.decoder3x6
add wave *
force -freeze sim:/decoder3x6/E 1 0

# Variando a entrada X
force -freeze sim:/decoder3x6/X 000 0
run 100 ns
force -freeze sim:/decoder3x6/X 001 0
run 100 ns
force -freeze sim:/decoder3x6/X 010 0
run 100 ns
force -freeze sim:/decoder3x6/X 011 0
run 100 ns
force -freeze sim:/decoder3x6/X 100 0
run 100 ns
force -freeze sim:/decoder3x6/X 101 0
run 100 ns
force -freeze sim:/decoder3x6/X 110 0
run 100 ns
force -freeze sim:/decoder3x6/X 111 0
run 100 ns
