
vlib work

vlog tb_full_adder.v +define+WIDTH=15

vsim work.tb

add wave -position insertpoint sim:/tb/dut/*

run -all