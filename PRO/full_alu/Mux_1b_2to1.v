module Mux_1b_2to1(A, B, sign, Out);
	
	input A, B, sign;
	output Out;
	
	assign Out = sign ? A : B;
	
endmodule
