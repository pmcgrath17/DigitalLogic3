module sevenseg (input logic [3:0] i_data, 
					  output logic [6:0] o_segments); 

	always_comb 
		case(i_data) 
			//                       abc_defg 
			0:       o_segments = 7'b000_0001; 
			1:       o_segments = 7'b100_1111; 
			2:       o_segments = 7'b001_0010; 
			3:       o_segments = 7'b000_0110; 
			4:       o_segments = 7'b100_1100; 
			5:       o_segments = 7'b010_0100; 
			6:       o_segments = 7'b010_0000; 
			7:       o_segments = 7'b000_1111; 
			8:       o_segments = 7'b000_0000; 
			9:       o_segments = 7'b000_1100; 
			10:      o_segments = 7'b000_1000;
			11:      o_segments = 7'b110_0000;
			12:      o_segments = 7'b011_0001;
			13:      o_segments = 7'b100_0010;
			14:      o_segments = 7'b011_0000;
			15:      o_segments = 7'b011_1000;
			default: o_segments = 7'b111_1111; 
		endcase 
		
endmodule 