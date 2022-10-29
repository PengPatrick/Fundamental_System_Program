module RCA(A, B, Cin, Sum, of, Cout);
	
	// Three Input, two 16 bit data, 1 bit Cin signal
	input [15:0] A, B;
	input Cin;
	// Three Output, one 16 bit data, 1 bit Cout signal, 1 bit next highest carry signal
	output [15:0] Sum;
	output Cout;
	output of;
	
	wire C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15;
	wire S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15;
	
	FA fa0(A[0], B[0], Cin, S0, C0);
	FA fa1(A[1], B[1], C0, S1, C1);
	FA fa2(A[2], B[2], C1, S2, C2);
	FA fa3(A[3], B[3], C2, S3, C3);
	FA fa4(A[4], B[4], C3, S4, C4);
	FA fa5(A[5], B[5], C4, S5, C5);
	FA fa6(A[6], B[6], C5, S6, C6);
	FA fa7(A[7], B[7], C6, S7, C7);
	FA fa8(A[8], B[8], C7, S8, C8);
	FA fa9(A[9], B[9], C8, S9, C9);
	FA fa10(A[10], B[10], C9, S10, C10);
	FA fa11(A[11], B[11], C10, S11, C11);
	FA fa12(A[12], B[12], C11, S12, C12);
	FA fa13(A[13], B[13], C12, S13, C13);
	FA fa14(A[14], B[14], C13, S14, C14);
	FA fa15(A[15], B[15], C14, S15, C15);
	
	assign Cout = C15;
	assign of = C14;
	
	assign Sum[0] = S0;
	assign Sum[1] = S1;
	assign Sum[2] = S2;
	assign Sum[3] = S3;
	assign Sum[4] = S4;
	assign Sum[5] = S5;
	assign Sum[6] = S6;
	assign Sum[7] = S7;
	assign Sum[8] = S8;
	assign Sum[9] = S9;
	assign Sum[10] = S10;
	assign Sum[11] = S11;
	assign Sum[12] = S12;
	assign Sum[13] = S13;
	assign Sum[14] = S14;
	assign Sum[15] = S15;	

endmodule


