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
// CREATED		"Wed Jun 05 11:15:19 2019"

module checker(
	data,
	clk,
	q
);


input wire	data;
input wire	clk;
output reg	q;

wire	[11:0] SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_11;





compare	b2v_inst(
	.a(SYNTHESIZED_WIRE_0),
	.gte(SYNTHESIZED_WIRE_11));
	defparam	b2v_inst.M = 1500;
	defparam	b2v_inst.N = 12;


sync	b2v_inst2(
	.d(data),
	.clk(clk),
	.q(SYNTHESIZED_WIRE_9));


sync	b2v_inst3(
	.d(SYNTHESIZED_WIRE_9),
	.clk(clk),
	.q(SYNTHESIZED_WIRE_10));

assign	SYNTHESIZED_WIRE_4 = SYNTHESIZED_WIRE_10 ^ SYNTHESIZED_WIRE_9;


encounter	b2v_inst5(
	.clk(clk),
	.reset(SYNTHESIZED_WIRE_4),
	.enable(SYNTHESIZED_WIRE_5),
	.q(SYNTHESIZED_WIRE_0));
	defparam	b2v_inst5.N = 12;

assign	SYNTHESIZED_WIRE_5 =  ~SYNTHESIZED_WIRE_11;


always@(posedge clk)
begin
if (SYNTHESIZED_WIRE_11)
	begin
	q <= SYNTHESIZED_WIRE_10;
	end
end


endmodule
