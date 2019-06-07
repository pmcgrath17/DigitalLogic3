module sync
	(input logic i_clk,
	input logic i_d,
	output logic o_q);

	logic n1;

	always_ff @(posedge i_clk)
		begin
			n1 <= i_d; // nonblocking
			o_q <= n1; // nonblocking
		end
		
endmodule