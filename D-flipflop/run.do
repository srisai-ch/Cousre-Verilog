#compilation

vlib work

vlog dff_gate.v
vlog tb_dff.v

#elaboration
vsim work.tb

add wave -position insertpoint sim:/tb/dut/*

#simulation
run -all