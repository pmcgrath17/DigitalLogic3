force i_reset_n 1 @ 0, 0 @ 5ps, 1 @ 10ps
force i_clk 0 @ 0, 1 @ 1ps -r 2ps
force {/ir_decoder/signal_transcriber/w_clk_divided[9]} 0 @ 0, 1 @ 51.2ps -r 102.4ps
force i_ir_signal 0 @ 0ps, 1 @ 100ps, 0 @ 9100.0ps, 1 @ 13600.0ps, 0 @ 14162.5ps, 1 @ 15850.0ps, 0 @ 16412.5ps, 1 @ 16975.0ps, 0 @ 17537.5ps, 1 @ 19225.0ps, 0 @ 19787.5ps, 1 @ 20350.0ps, 0 @ 20912.5ps, 1 @ 22600.0ps, 0 @ 23162.5ps, 1 @ 23725.0ps, 0 @ 24287.5ps, 1 @ 24850.0ps, 0 @ 25412.5ps, 1 @ 25975.0ps, 0 @ 26537.5ps, 1 @ 27100.0ps, 0 @ 27662.5ps, 1 @ 29350.0ps, 0 @ 29912.5ps, 1 @ 30475.0ps, 0 @ 31037.5ps, 1 @ 32725.0ps, 0 @ 33287.5ps, 1 @ 33850.0ps, 0 @ 34412.5ps, 1 @ 36100.0ps, 0 @ 36662.5ps, 1 @ 38350.0ps, 0 @ 38912.5ps, 1 @ 40600.0ps, 0 @ 41162.5ps, 1 @ 42850.0ps, 0 @ 43412.5ps, 1 @ 43975.0ps, 0 @ 44537.5ps, 1 @ 45100.0ps, 0 @ 45662.5ps, 1 @ 47350.0ps, 0 @ 47912.5ps, 1 @ 48475.0ps, 0 @ 49037.5ps, 1 @ 49600.0ps, 0 @ 50162.5ps, 1 @ 50725.0ps, 0 @ 51287.5ps, 1 @ 51850.0ps, 0 @ 52412.5ps, 1 @ 52975.0ps, 0 @ 53537.5ps, 1 @ 55225.0ps, 0 @ 55787.5ps, 1 @ 57475.0ps, 0 @ 58037.5ps, 1 @ 58600.0ps, 0 @ 59162.5ps, 1 @ 60850.0ps, 0 @ 61412.5ps, 1 @ 63100.0ps, 0 @ 63662.5ps, 1 @ 65350.0ps, 0 @ 65912.5ps, 1 @ 67600.0ps, 0 @ 68162.5ps

run 119000