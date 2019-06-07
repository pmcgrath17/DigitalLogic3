module checksum_validator #(parameter SIGNAL_WIDTH = 32)
	(input logic [SIGNAL_WIDTH-1:0] i_data,
	output logic o_checksum_valid);
	
	parameter ONE_QUARTER_WIDTH = SIGNAL_WIDTH / 4;
	parameter TWO_QUARTER_WIDTH = 2 * ONE_QUARTER_WIDTH;
	parameter THREE_QUARTER_WIDTH = 3 * ONE_QUARTER_WIDTH;
	
	logic [ONE_QUARTER_WIDTH-1:0] w_q1, w_q2, w_q3, w_q4;
	logic w_half1_valid, w_half2_valid;
	
	assign w_q1 = i_data[ONE_QUARTER_WIDTH-1:0];
	assign w_q2 = i_data[TWO_QUARTER_WIDTH-1:ONE_QUARTER_WIDTH];
	assign w_q3 = i_data[THREE_QUARTER_WIDTH-1:TWO_QUARTER_WIDTH];
	assign w_q4 = i_data[SIGNAL_WIDTH-1:THREE_QUARTER_WIDTH];
	
	assign o_checksum_valid = & {w_q1 ^ w_q2, w_q3 ^ w_q4};

endmodule