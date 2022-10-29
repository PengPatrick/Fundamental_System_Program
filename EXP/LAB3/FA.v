module FA(A, B, Cin, Sum, Cout);
	
	input A;
	input B;
	input Cin;
	output Sum;
	output Cout;
	
	/*
	wire S1, C1;
	wire S2, C2;
	wire C3;
	
	HA (A, B, S1, C1);
	HA (Cin, S1, S2, C2);
	or (C3, C1, C2);
	
	assign Sum = S2;
	assign Cout = C3;
	*/
	
	wire X1, S1, S2, C1, C2;
	xor (X1, A, B);
	and (S1, A, B);
	and (S2, S1, Cin);
	xor (C1, X1, Cin);
	or (C2, S1, S2);
	
	assign Sum = C1;
	assign Cout = C2;
	
endmodule
