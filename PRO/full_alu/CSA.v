module CSA(A, B, Cin, Sum, ofOut, Cout);

	// Three Input, two 32 bit data, one Cin signal
	input [31:0] A, B;
	input Cin;
	// Three Output, one 32 bit data, one Cout signal, one next highest carry signal
	output [31:0] Sum;
	output Cout;
	output ofOut;
	
	wire C1, C2, C3;
	wire O1, O2, O3;
	wire [15:0] S1, S2, S3, S4;
	
	RCA rca1(A[15:0], B[15:0], Cin, S1, O1, C1);
	RCA rca2(A[31:16], B[31:16], 1'd0, S2, O2, C2);
	RCA rca3(A[31:16], B[31:16], 1'd1, S3, O3, C3);
	
	assign Sum[15:0] = S1;
	
	// Implement the mux, to choose from 2 RCA; choose 3 output
	assign Sum[31:16] = C1 ? S3 : S2;
	assign Cout = C1 ? C3 : C2;
	assign ofOut = C1 ? O3 : O2;
	
	
endmodule
