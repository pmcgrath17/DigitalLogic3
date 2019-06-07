module final_project
	(input logic i_clk, // 50MHz clock
	input logic i_reset_n,
	input logic i_nes_data,
	input logic i_ps2_clk, i_ps2_data,
	input logic i_ir_signal,
	input logic i_sel0, i_sel1,
	output logic i_nes_clk, i_nes_latch,
	output logic o_led0, o_led1, o_led2, o_led3, o_led4, o_led5, o_led6, o_led7,
	output logic [6:0] o_sevenseg0, o_sevenseg1);
	
	logic [7:0] w_leds_nes, w_leds;
	logic w_led_ps2, w_led_vcr;
	
	logic [13:0] w_sevensegs_ps2, w_sevensegs;
	logic [6:0] w_sevenseg_vcr;
	
	// Fetch and decode NES data
	DP_NES nes_reader (
		.dataYellow(i_nes_data),
		.clock(i_clk),
		.reset_n(i_reset_n),
		.latchOrange(i_nes_latch),
		.clockRed(i_nes_clk),
		.up(w_leds_nes[0]),
		.down(w_leds_nes[1]),
		.left(w_leds_nes[2]),
		.right(w_leds_nes[3]),
		.start(w_leds_nes[4]),
		.select(w_leds_nes[5]),
		.a(w_leds_nes[6]),
		.b(w_leds_nes[7])
	);
	
	// Decode incoming PS2 keyboard data
	PS_2 ps2_decoder (
		.data(i_ps2_data),
		.device_clock(i_ps2_clk),
		.clock(i_clk), // TODO: Double check necessary clock frequency
		.debug(w_led_ps2),
		.ones(w_sevensegs_ps2[6:0]),
		.sixteens(w_sevensegs_ps2[13:7])
	);
	
	// Decode incoming IR VCR remote data
	ir_decoder vcr_decoder (
		.i_clk(i_clk),
		.i_reset_n(i_reset_n),
		.i_ir_signal(i_ir_signal),
		.o_button_ss(w_sevenseg_vcr),
		.o_checksum_valid(w_led_vcr)
	);
	
	// Chose what device to output to the leds from
	devices_mux #(.N(8)) leds_mux (
		.i_default(8'b0),
		.i_nes(w_leds_nes),
		.i_ps2({7'b0, w_led_ps2}),
		.i_vcr({7'b0, w_led_vcr}),
		.i_sel({i_sel1, i_sel0}),
		.o_selection({o_led7, o_led6, o_led5, o_led4, o_led3, o_led2, o_led1, o_led0})
	);
	
	// Chose what device to output to the 7-segment displays from
	devices_mux #(.N(14)) sevensegs_mux (
		.i_default(14'b1),
		.i_nes(14'b1),
		.i_ps2(w_sevensegs_ps2),
		.i_vcr({7'b0, w_sevenseg_vcr}),
		.i_sel({i_sel1, i_sel0}),
		.o_selection({o_sevenseg1, o_sevenseg0})
	);
	
endmodule