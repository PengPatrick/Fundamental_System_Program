module HA(A, B, Sum, Cout);
	
	input A;
	input B;
	output Sum;
	output Cout;
	
	wire X1, X2;
	xor (X1, A, B);
	and (X2, A, B);
	
	assign Sum = X1;
	assign Cout = X2;
	
endmodule
