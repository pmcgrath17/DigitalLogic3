module valid #(parameter N = 11)
				  (input [N-1:0] a,
				   output works);
					
	assign works = (a[9] ^ a[8] ^ a[7] ^ a[6] ^ a[5] ^ a[4] ^ a[3] ^ a[2] ^ a[1] ^ a[0]);
		
endmodule 