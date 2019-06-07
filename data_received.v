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
// CREATED		"Wed Jun 05 11:14:24 2019"

module data_received(
	data,
	clk,
	message
);


input wire	data;
input wire	clk;
output wire	[10:0] message;

wire	[10:0] message_ALTERA_SYNTHESIZED;





sync	b2v_inst(
	.d(data),
	.clk(clk),
	.q(message_ALTERA_SYNTHESIZED[0]));


sync	b2v_inst1(
	.d(message_ALTERA_SYNTHESIZED[0]),
	.clk(clk),
	.q(message_ALTERA_SYNTHESIZED[1]));


sync	b2v_inst10(
	.d(message_ALTERA_SYNTHESIZED[9]),
	.clk(clk),
	.q(message_ALTERA_SYNTHESIZED[10]));


sync	b2v_inst2(
	.d(message_ALTERA_SYNTHESIZED[1]),
	.clk(clk),
	.q(message_ALTERA_SYNTHESIZED[2]));


sync	b2v_inst3(
	.d(message_ALTERA_SYNTHESIZED[2]),
	.clk(clk),
	.q(message_ALTERA_SYNTHESIZED[3]));


sync	b2v_inst4(
	.d(message_ALTERA_SYNTHESIZED[3]),
	.clk(clk),
	.q(message_ALTERA_SYNTHESIZED[4]));


sync	b2v_inst5(
	.d(message_ALTERA_SYNTHESIZED[4]),
	.clk(clk),
	.q(message_ALTERA_SYNTHESIZED[5]));


sync	b2v_inst6(
	.d(message_ALTERA_SYNTHESIZED[5]),
	.clk(clk),
	.q(message_ALTERA_SYNTHESIZED[6]));


sync	b2v_inst7(
	.d(message_ALTERA_SYNTHESIZED[6]),
	.clk(clk),
	.q(message_ALTERA_SYNTHESIZED[7]));


sync	b2v_inst8(
	.d(message_ALTERA_SYNTHESIZED[7]),
	.clk(clk),
	.q(message_ALTERA_SYNTHESIZED[8]));


sync	b2v_inst9(
	.d(message_ALTERA_SYNTHESIZED[8]),
	.clk(clk),
	.q(message_ALTERA_SYNTHESIZED[9]));

assign	message = message_ALTERA_SYNTHESIZED;

endmodule
