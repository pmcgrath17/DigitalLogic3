module message #(parameter N=11, M=8)
					 (input logic [N-1:0] d, 
					  input logic clk, enable,
					  output logic [M-1:0] q); 
 
	logic [M-1:0] n1; 
		always_ff @(posedge clk) 
			if(enable)
				begin
					n1 <= d[N-1:3]; // nonblocking 
					q <= n1; // nonblocking 
				end

endmodule 