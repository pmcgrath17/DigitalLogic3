force i_clk 0 @ 0, 1 @ 1ps -r 2ps
force i_reset_n 1 @ 0, 0 @ 5ps, 1 @ 10ps
force i_enable 1 @ 0, 0 @ 35ps, 1 @ 50ps
force i_load 0 @ 0, 1 @ 70ps, 0 @ 75ps
force i_sin 0 @ 0, 1 @ 15ps, 0 @ 25ps, 1 @ 30ps, 0 @ 40ps
force i_pin 8'b10101010 @ 0ps

run 100