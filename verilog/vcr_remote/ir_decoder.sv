module ir_decoder
	(input logic i_clk,
	input logic i_reset_n,
	input logic i_ir_signal,
	output logic [6:0] o_button_ss,
	output logic o_checksum_valid);
	
	// Bits in a signal code
	parameter SIGNAL_WIDTH = 32;	
	
	logic [SIGNAL_WIDTH-1:0] w_working_bits, w_stored_code;
	logic w_read_bits, w_latest_bit;
	
	logic [3:0] w_button;
	
	// Determine whether bits are being read and the latest bit read
	ir_signal_transcriber signal_transcriber (
		.i_clk(i_clk),
		.i_reset_n(i_reset_n),
		.i_ir_signal(i_ir_signal),
		.o_read_bits(w_read_bits),
		.o_latest_bit(w_latest_bit)
	);
	
	// Push code bits into a shift register as they come in
	shiftreg #(.N(SIGNAL_WIDTH)) bit_store (
		.i_clk(i_ir_signal),
		.i_reset_n(i_reset_n),
		.i_enable(w_read_bits),
		.i_load(0),
		.i_sin(w_latest_bit),
		.i_pin(0),
		.o_pout(w_working_bits),
		.o_sout()
	);
	
	// Store the final code once all of the bits in the sequence have been read
	shiftreg #(.N(SIGNAL_WIDTH)) final_code (
		.i_clk(~w_read_bits),
		.i_reset_n(i_reset_n),
		.i_enable(1),
		.i_load(1),
		.i_sin(0),
		.i_pin(w_working_bits),
		.o_pout(w_stored_code),
		.o_sout()
	);
	
	// Determine if the checksum is valid
	checksum_validator #(.SIGNAL_WIDTH(SIGNAL_WIDTH)) validator (
		.i_data(w_stored_code),
		.o_checksum_valid(o_checksum_valid)
	);
	
	// Translate the IR code to the corresponding number
	ir_code_decoder #(.SIGNAL_WIDTH(SIGNAL_WIDTH)) code_decoder (
		.i_ir_code(w_stored_code),
		.o_decoded(w_button)
	);
	
	// Convert the button value to a 7-segment display value
	sevenseg sevenseg_converter (
		.i_data(w_button),
		.o_segments(o_button_ss)
	);
	
endmodule