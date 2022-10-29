module FA(A, B, Cin, Sum, Cout);
	
	input A, B, Cin;
	output Sum, Cout;
	
	/*  Using half adder to implement FA */
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
	
	wire S1, S2, S3;
	// logic sum
	xor xor1(Sum, A, B, Cin); 

	// logic Cout 
	and and1(S1, A, B);
	and and2(S2, A, Cin);
	and and3(S3, B, Cin);
	or or1(Cout, S1, S2, S3);

	
endmodule
