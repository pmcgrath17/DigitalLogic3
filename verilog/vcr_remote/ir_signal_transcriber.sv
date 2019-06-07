module ir_signal_transcriber
	(input logic i_clk,
	input logic i_reset_n,
	input logic i_ir_signal,
	output logic o_read_bits,
	output logic o_latest_bit);
	
	// log_2 (10MHz / 10KHz) = 9.966
	parameter DIVIDER = 10;
	
	// Enough to store up to LEADER_HIGH_COMPARE_VAL
	parameter LEADER_HIGH_COUNT_BITS = 7;
	// Time leader pulse is high for 
	// Leader high pulse is 9ms, modified to account for not exactly 10KHz clock
	// (9ms / 102.4 us = 87.89)
	parameter LEADER_HIGH_COMPARE_VAL = 85;
	
	// Enough to store up to LEADER_LOW_COMPARE_VAL
	parameter LEADER_LOW_COUNT_BITS = 6;
	// Time leader pulse is low for, plus a little to skip the first rising edge
	// Low pulse is 4.5ms
	// (4.5ms / 102.4 us = 43.94
	parameter LEADER_LOW_COMPARE_VAL = 46;
	
	// Enough to store BIT_COMPARE_VAL
	parameter BIT_COUNT_BITS = 6;
	// 32 bits in each block of IR data
	parameter BIT_COMPARE_VAL = 32;
	
	// Enough to store PULSE_COMPARE_VAL
	parameter PULSE_COUNT_BITS = 5;
	// 0 pulse spacing = .5625 ms, 1 pulse spacing = 1.6875 ms
	// avg = 1.125ms, avg/102.4 us = 10.98
	parameter PULSE_COMPARE_VAL = 11;
	
	// -------------------------------------------------
	
	logic [DIVIDER-1:0] w_clk_divided;
	
	logic [LEADER_HIGH_COUNT_BITS-1:0] w_leader_high_count;
	logic w_leader_high_compare, w_leader_high_reset;
	
	logic [LEADER_LOW_COUNT_BITS-1:0] w_leader_low_count;
	logic w_leader_low_compare, w_leader_low_reset;
	
	logic [BIT_COUNT_BITS-1:0] w_bit_count;
	logic w_bit_compare, w_bit_reset;
	
	logic [PULSE_COUNT_BITS-1:0] w_pulse_count;
	logic w_pulse_compare, w_pulse_reset;
	
	// -------------------------------------------------
	
	// Divide clock from 10MHz to 10KHz
	// Actual clock period = 1/(10MHz / 2^10) = 102.4 us
	sync_counter #(.N(DIVIDER)) divider (
		.i_clk(i_clk),
		.i_clk_orig(i_clk),
		.i_reset_n(i_reset_n),
		.i_reset_cond(0),
		.i_enable(1),
		.o_count(w_clk_divided)
	);
	
	
	// Count for 9ms leader high pulse
	// Enabled as long as it hasn't yet reached its comparison value
	sync_counter #(.N(LEADER_HIGH_COUNT_BITS)) leader_high_count (
		.i_clk(w_clk_divided[DIVIDER-1]),
		.i_clk_orig(i_clk),
		.i_reset_n(i_reset_n),
		.i_reset_cond(w_leader_high_reset),
		.i_enable(~w_leader_high_compare),
		.o_count(w_leader_high_count)
	);
	
	// Check length of leader pulse
	assign w_leader_high_compare = w_leader_high_count > LEADER_HIGH_COMPARE_VAL;
	
	// Reset leader high counter when either 32 bits are read or
	// the value is not reached and the signal goes low again (error)
	assign w_leader_high_reset = w_bit_compare | (~w_leader_high_compare & ~i_ir_signal);
	
	
	// Count for 4.5ms leader low pulse
	// Enabled after high counter has reached its comparison value
	// as long as it hasn't yet reached its comparison value
	sync_counter #(.N(LEADER_LOW_COUNT_BITS)) leader_low_count (
		.i_clk(w_clk_divided[DIVIDER-1]),
		.i_clk_orig(i_clk),
		.i_reset_n(i_reset_n),
		.i_reset_cond(w_leader_low_reset),
		.i_enable(w_leader_high_compare & ~w_leader_low_compare),
		.o_count(w_leader_low_count)
	);
	
	// Check length of leader pulse
	assign w_leader_low_compare = w_leader_low_count > LEADER_LOW_COMPARE_VAL;
	
	// Reset leader low counter when 32 bits are read
	assign w_leader_low_reset = w_bit_compare;
	
	
	// Count number of bits read
	// Enabled after the leader has been seen
	sync_counter #(.N(BIT_COUNT_BITS)) bit_count (
		.i_clk(i_ir_signal),
		.i_clk_orig(i_clk),
		.i_reset_n(i_reset_n),
		.i_reset_cond(w_bit_reset),
		.i_enable(w_leader_low_compare),
		.o_count(w_bit_count)
	);
	
	// Check number of bits read
	assign w_bit_compare = w_bit_count >= BIT_COMPARE_VAL;
	
	// Reset bit counter when 32 bits are read
	assign w_bit_reset = w_bit_compare;
	
	
	// Count length of pulse spacing
	// Enabled after the leader has been seen
	sync_counter #(.N(PULSE_COUNT_BITS)) pulse_count (
		.i_clk(w_clk_divided[DIVIDER-1]),
		.i_clk_orig(i_clk),
		.i_reset_n(i_reset_n),
		.i_reset_cond(w_pulse_reset),
		.i_enable(w_leader_low_compare),
		.o_count(w_pulse_count)
	);
	
	// Check length of pulse spacing
	assign w_pulse_compare = w_pulse_count >= PULSE_COMPARE_VAL;
	
	// Reset when IR signal goes high again
	assign w_pulse_reset = i_ir_signal;
	
	
	// Pull bits into the shift register while reading bits
	assign o_read_bits = w_leader_low_compare & ~w_bit_compare;
	
	// Latest bit depends on the length of the most recent pulse spacing
	assign o_latest_bit = w_pulse_compare;
	
endmodule