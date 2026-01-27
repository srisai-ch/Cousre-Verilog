#compilation

vlib work

vlog tb_comp_1bit.v

#elaboration
vsim work.tb

add wave -position insertpoint sim:/tb/dut/*

#simulation
run -all