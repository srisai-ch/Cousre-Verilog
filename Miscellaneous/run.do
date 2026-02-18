vlib work

vlog arbiter.v
vlog arbiter_tb.v

vsim tb_arbiter

#add wave -position insertpoint sim:/tb/dut/*

run -all