module bitwise_or(A, B, Out);
	
	input [31:0] A, B;
	output [31:0] Out;
	
	genvar i;
	
	generate
		for(i = 0; i < 32; i = i + 1) begin : or_block
			or or1(Out[i], A[i], B[i]);
		end
	endgenerate
	

endmodule
