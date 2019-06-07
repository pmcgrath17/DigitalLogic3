module counter #(parameter N = 8)
		(input logic clk,
		input logic reset,
		output logic [N-1:0] q);

	always_ff @(posedge clk, posedge reset)
		if(reset) q <= 0;
		else q <= q + 1;
endmodule

/*
add wave *
force reset 1 @ 0, 0 @ 10
force clk 0 @ 0, 1 @ 5 -r 10
run 2570
*/