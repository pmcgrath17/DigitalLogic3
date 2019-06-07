module compare #(parameter N = 12, M = 1500)
						 (input logic [N-1:0] a,
						  output logic gte);
						  

	assign gte = (a >= M);
	
endmodule 