onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /testbench/i
add wave -noupdate -radix unsigned /testbench/X
add wave -noupdate -radix unsigned /testbench/gray
add wave -noupdate -radix unsigned /testbench/clk
add wave -noupdate -radix unsigned /testbench/reset
add wave -noupdate -radix unsigned /testbench/invalid
add wave -noupdate -radix unsigned /testbench/R
add wave -noupdate -radix unsigned /testbench/G
add wave -noupdate -radix unsigned /testbench/B
add wave -noupdate -radix unsigned /testbench/Y
add wave -noupdate -radix unsigned /testbench/outvalid
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
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
WaveRestoreZoom {0 ps} {2301368 ps}
