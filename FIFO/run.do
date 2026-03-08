
vlib work

vlog fifo_sync.v
vlog tb_fifo_sync.v

vsim work.tb

add wave -position insertpoint sim:/tb/dut/*



run -all