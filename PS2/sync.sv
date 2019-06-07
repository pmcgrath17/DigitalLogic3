module sync (input logic d, 
             input logic clk, 
             output logic q); 
 
	logic n1; 
	always_ff @(posedge clk) 
		begin q <= d; // nonblocking 
//		q <= n1; // nonblocking 
	end 

endmodule 