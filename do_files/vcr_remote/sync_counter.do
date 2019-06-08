radix signal o_count unsigned

force i_clk_orig 0 @ 0, 1 @ 1ps -r 2ps
force i_clk 0 @ 0, 1 @ 2ps -r 4ps
force i_reset_n 1 @ 0, 0 @ 5ps, 1 @ 10ps
force i_reset_cond 0 @ 0, 1 @ 20ps, 0 @ 25ps
force i_enable 1 @ 0, 0 @ 40ps, 1 @ 60ps

run 100