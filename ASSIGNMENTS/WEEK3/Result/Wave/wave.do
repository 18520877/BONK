onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /testbench/i
add wave -noupdate -radix decimal /testbench/clk
add wave -noupdate -radix decimal /testbench/reset
add wave -noupdate -radix unsigned /testbench/pxl_in
add wave -noupdate -radix decimal /testbench/Out
add wave -noupdate -radix decimal /testbench/pxl_out
add wave -noupdate -radix decimal /testbench/valid
add wave -noupdate -radix decimal /testbench/reg_00
add wave -noupdate -radix decimal /testbench/reg_01
add wave -noupdate -radix decimal /testbench/reg_02
add wave -noupdate -radix decimal /testbench/sr_0
add wave -noupdate -radix decimal /testbench/reg_220
add wave -noupdate -radix decimal /testbench/reg_221
add wave -noupdate -radix decimal /testbench/reg_222
add wave -noupdate -radix decimal /testbench/sr_1
add wave -noupdate -radix decimal /testbench/reg_440
add wave -noupdate -radix decimal /testbench/reg_441
add wave -noupdate -radix decimal /testbench/reg_442
add wave -noupdate -radix unsigned /testbench/test
add wave -noupdate -radix unsigned /testbench/test_valid
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4414620 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {4297783 ps} {4545943 ps}
