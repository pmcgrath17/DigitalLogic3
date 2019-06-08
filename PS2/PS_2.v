// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 18.0.0 Build 614 04/24/2018 SJ Lite Edition"
// CREATED		"Fri Jun 07 04:59:37 2019"

module PS_2(
	data,
	device_clock,
	clock,
	debug,
	hex1,
	hex2,
	ones,
	sixteens
);


input wire	data;
input wire	device_clock;
input wire	clock;
output wire	debug;
output wire	[3:0] hex1;
output wire	[3:0] hex2;
output wire	[6:0] ones;
output wire	[6:0] sixteens;

wire	[7:0] display;
wire	falling_edge_ps2Clock;
wire	SYNTHESIZED_WIRE_0;
wire	[10:0] SYNTHESIZED_WIRE_13;
wire	[11:0] SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_12;





data_received	b2v_inst(
	.data(SYNTHESIZED_WIRE_0),
	.clk(falling_edge_ps2Clock),
	.message(SYNTHESIZED_WIRE_13));


valid	b2v_inst10(
	.a(SYNTHESIZED_WIRE_13),
	.works(SYNTHESIZED_WIRE_5));
	defparam	b2v_inst10.N = 11;


compare	b2v_inst12(
	.a(SYNTHESIZED_WIRE_2),
	.gte(SYNTHESIZED_WIRE_14));
	defparam	b2v_inst12.M = 2600;
	defparam	b2v_inst12.N = 12;


encounter	b2v_inst13(
	.clk(clock),
	.reset(falling_edge_ps2Clock),
	.enable(SYNTHESIZED_WIRE_3),
	.q(SYNTHESIZED_WIRE_2));
	defparam	b2v_inst13.N = 12;

assign	falling_edge_ps2Clock =  ~SYNTHESIZED_WIRE_4;

assign	SYNTHESIZED_WIRE_15 = SYNTHESIZED_WIRE_5 & SYNTHESIZED_WIRE_14;

assign	SYNTHESIZED_WIRE_3 =  ~SYNTHESIZED_WIRE_14;


sevenseg	b2v_inst19(
	.data(display[3:0]),
	.segments(ones));


sync	b2v_inst2(
	.d(device_clock),
	.clk(clock),
	.q(SYNTHESIZED_WIRE_12));


sevenseg	b2v_inst20(
	.data(display[7:4]),
	.segments(sixteens));


sync	b2v_inst3(
	.d(data),
	.clk(clock),
	.q(SYNTHESIZED_WIRE_8));


checker	b2v_inst4(
	.data(SYNTHESIZED_WIRE_8),
	.clk(clock),
	.q(SYNTHESIZED_WIRE_0));


message	b2v_inst5(
	.clk(clock),
	.enable(SYNTHESIZED_WIRE_15),
	.d(SYNTHESIZED_WIRE_13),
	.q(display));
	defparam	b2v_inst5.M = 8;
	defparam	b2v_inst5.N = 11;


sync	b2v_inst6(
	.d(SYNTHESIZED_WIRE_15),
	.clk(clock),
	.q(debug));


checker	b2v_inst7(
	.data(SYNTHESIZED_WIRE_12),
	.clk(clock),
	.q(SYNTHESIZED_WIRE_4));

assign	hex1[3:0] = display[3:0];
assign	hex2[3:0] = display[7:4];

endmodule
