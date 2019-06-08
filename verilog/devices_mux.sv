module devices_mux #(parameter N = 8)
	(input logic [N-1:0] i_default, i_nes, i_ps2, i_vcr,
	input logic [1:0] i_sel,
	output logic [N-1:0] o_selection);
	
	always_comb
		case(i_sel)
			2'b01: o_selection = i_nes;
			2'b10: o_selection = i_ps2;
			2'b11: o_selection = i_vcr;
			default: o_selection = 0;
		endcase
	
endmodule