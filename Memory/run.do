
vlib work

vlog memory.v
vlog tb_memory_1.v

vsim work.tb

#add wave -position insertpoint sim:/tb/dut/*

do wave_mem.do

run -all