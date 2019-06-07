module shiftreg #(parameter N = 8)
	(input logic i_clk,
	input logic i_reset_n,
	input logic i_enable,
	input logic i_load,
	input logic i_sin,
	input logic [N-1:0] i_pin,
	output logic [N-1:0] o_pout,
	output logic o_sout);

	always_ff @(posedge i_clk, negedge i_reset_n)
		if (!i_reset_n)  o_pout <= 0;
		else if (i_enable) begin
			if (i_load) o_pout <= i_pin;
			else        o_pout <= {o_pout[N-2:0], i_sin};
		end
		
	assign o_sout = o_pout[N-1];
	
endmodule