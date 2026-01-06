#compilation
vlog tb_half_adder.v

#elaboration
vsim work.tb

add wave -position insertpoint sim:/tb/dut/*

#simulation
run -all