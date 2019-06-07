module hvsync #(parameter N = 10, M = 800, L = 96)
		(input logic clock25,
		 input logic reset,
		 output logic h);

	logic [N-1:0] intern;
	always_ff @(posedge clock25, posedge reset)
		if (reset | intern == (M-1)) intern <= 0;
		else intern <= intern + 1;

	assign y = (intern >= L);

endmodule
		
