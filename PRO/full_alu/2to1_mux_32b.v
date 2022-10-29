module 2to1_mux_32b(A, B, sign, Out);
	
	input [31:0] A, B;
	input sign;
	output [31:0] Out;
	
	assign Out = sign ? B : A;
	
endmodule
