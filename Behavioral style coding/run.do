
vlib work

vlog circuit2.v
vlog circuit2_tb.v

vsim work.tb

add wave -divider "TB Signals"
add wave sim:/circuit2_tb/clk
add wave sim:/circuit2_tb/res
add wave sim:/circuit2_tb/a
add wave sim:/circuit2_tb/b
add wave sim:/circuit2_tb/y

run -all