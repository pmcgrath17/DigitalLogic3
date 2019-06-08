radix signal o_count unsigned

force i_clk 0 @ 0, 1 @ 1ps -r 2ps
force i_reset_n 1 @ 0, 0 @ 5ps, 1 @ 10ps, 0 @ 35ps, 1 @ 40ps
force i_enable 1 @ 0, 0 @ 20ps, 1 @ 25ps

run 50