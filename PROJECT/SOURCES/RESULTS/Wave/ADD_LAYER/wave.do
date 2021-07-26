onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /tb_add_layer/i
add wave -noupdate -radix hexadecimal /tb_add_layer/j
add wave -noupdate -radix hexadecimal /tb_add_layer/clk
add wave -noupdate -radix hexadecimal /tb_add_layer/reset
add wave -noupdate -radix hexadecimal /tb_add_layer/valid_in_1
add wave -noupdate -radix hexadecimal /tb_add_layer/valid_in_2
add wave -noupdate -radix hexadecimal /tb_add_layer/pxl_in_1
add wave -noupdate -radix hexadecimal /tb_add_layer/pxl_in_2
add wave -noupdate -radix hexadecimal /tb_add_layer/Out
add wave -noupdate -radix hexadecimal /tb_add_layer/pxl_out
add wave -noupdate -radix hexadecimal /tb_add_layer/valid_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 216
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {7509757500 ps}
