module sync_counter #(parameter N = 6)
	(input logic i_clk,
	input logic i_clk_orig,
	input logic i_reset_n, // The reset button
	input logic i_reset_cond, // Extra condtion to reset based off of
	input logic i_enable,
	output logic [N-1:0] o_count);
	
	logic w_reset_sync;
	
	counter #(.N(N)) count (
		.i_clk(i_clk),
		.i_reset_n(w_reset_sync),
		.i_enable(i_enable),
		.o_count(o_count)
	);
	
	sync synchronizer (
		.i_clk(i_clk_orig),
		.i_d(i_reset_n & ~i_reset_cond),
		.o_q(w_reset_sync)
	);
	
endmodule