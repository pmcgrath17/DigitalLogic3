radix signal i_data hex
radix signal w_q1 hex
radix signal w_q2 hex
radix signal w_q3 hex
radix signal w_q4 hex

force i_data 32'h0 @ 0, 32'hF00FF00F @ 10ps, 32'hFF00FF00 @ 20ps, 32'hFFF0FF00 @ 30ps, 32'hA857D02F @ 40ps, 32'hA857807F @ 50ps, 32'hA85740BF @ 60ps, 32'hA85740B0 @ 70ps

run 80ps