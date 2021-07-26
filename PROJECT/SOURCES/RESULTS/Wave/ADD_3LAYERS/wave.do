onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /tb_add_3layers/uut/clk
add wave -noupdate -radix hexadecimal /tb_add_3layers/uut/reset
add wave -noupdate -radix hexadecimal /tb_add_3layers/uut/valid_in_1
add wave -noupdate -radix hexadecimal /tb_add_3layers/uut/valid_in_2
add wave -noupdate -radix hexadecimal /tb_add_3layers/uut/valid_in_3
add wave -noupdate -radix hexadecimal /tb_add_3layers/uut/pxl_in_1
add wave -noupdate -radix hexadecimal /tb_add_3layers/uut/pxl_in_2
add wave -noupdate -radix hexadecimal /tb_add_3layers/uut/pxl_in_3
add wave -noupdate -radix hexadecimal /tb_add_3layers/uut/pxl_out_1
add wave -noupdate -radix hexadecimal /tb_add_3layers/uut/valid_out_1
add wave -noupdate -radix hexadecimal /tb_add_3layers/uut/pxl_out
add wave -noupdate -radix hexadecimal /tb_add_3layers/uut/valid_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3117435582 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 261
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
WaveRestoreZoom {0 ps} {11264599500 ps}
