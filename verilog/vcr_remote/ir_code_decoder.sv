module ir_code_decoder #(parameter SIGNAL_WIDTH = 32)
	(input logic [SIGNAL_WIDTH-1:0] i_ir_code,
	output logic [3:0] o_decoded);
	
	always_comb
		case(i_ir_code)
			32'hA857D02F: o_decoded = 0;
			32'hA857807F: o_decoded = 1;
			32'hA85740BF: o_decoded = 2;
			32'hA857C03F: o_decoded = 3;
			32'hA85720DF: o_decoded = 4;
			32'hA857A05F: o_decoded = 5;
			32'hA857609F: o_decoded = 6;
			32'hA857E01F: o_decoded = 7;
			32'hA85710EF: o_decoded = 8;
			32'hA857906F: o_decoded = 9;
			default:      o_decoded = 15;
		endcase
	
endmodule