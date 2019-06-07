module counter #(parameter N = 6)
	(input logic i_clk,
	input logic i_reset_n,
	input logic i_enable,
	output logic [N-1:0] o_count);

	always_ff @(posedge i_clk, negedge i_reset_n)
		begin
			if (!i_reset_n)    o_count <= 0;
			else if (i_enable) o_count <= o_count + 1;
	end
	
endmodule