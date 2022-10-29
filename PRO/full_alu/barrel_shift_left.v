module barrel_shift_left(A, amt, Out);

	input [31:0] A;
	input [4:0] amt;
	output [31:0] Out;
	
	// First Iteration
	wire [31:0] S1;
	Mux_1b_2to1 shift0(0, A[0], amt[0], S1[0]);
	
	genvar i1;
	
	generate
		for(i1 = 1; i1 < 32; i1 = i1 + 1) begin : shift_block1
			Mux_1b_2to1 shift1(A[i1-1], A[i1], amt[0], S1[i1]);
		end
	endgenerate
	
	// Second Iteration
	wire [31:0] S2;
	Mux_1b_2to1 shift21(0, S1[0], amt[1], S2[0]);
	Mux_1b_2to1 shift22(0, S1[1], amt[1], S2[1]);
	genvar i2;
	
	generate
		for(i2 = 2; i2 < 32; i2 = i2 + 1) begin : shift_block2
			Mux_1b_2to1 shift3(S1[i2-2], S1[i2], amt[1], S2[i2]);
		end
	endgenerate
	
	
	// Third Iteration
	wire [31:0] S3;
	Mux_1b_2to1 shift41(0, S2[0], amt[2], S3[0]);
	Mux_1b_2to1 shift42(0, S2[1], amt[2], S3[1]);
	Mux_1b_2to1 shift43(0, S2[2], amt[2], S3[2]);
	Mux_1b_2to1 shift44(0, S2[3], amt[2], S3[3]);
	
	genvar i3;
	
	generate
		for(i3 = 4; i3 < 32; i3 = i3 + 1) begin : shift_block3
			Mux_1b_2to1 shift5(S2[i3-4], S2[i3], amt[2], S3[i3]);
		end
	endgenerate
	
	
	// Forth Iteration
	wire [31:0] S4;
	
	genvar j4;
	generate
		for(j4 = 0; j4 < 8; j4 = j4 + 1) begin : shift_block41
			Mux_1b_2to1 shift6(0, S3[j4], amt[3], S4[j4]);
		end
	endgenerate

	genvar i4;
	
	generate
		for(i4 = 8; i4 < 32; i4 = i4 + 1) begin : shift_block42
			Mux_1b_2to1 shift7(S3[i4-8], S3[i4], amt[3], S4[i4]);
		end
	endgenerate
	
	// Final Iteration
	wire [31:0] S5;
	
	genvar j5;
	generate
		for(j5 = 0; j5 < 16; j5 = j5 + 1) begin : shift_block51
			Mux_1b_2to1 shift6(0, S4[j5], amt[4], S5[j5]);
		end
	endgenerate

	genvar i5;
	
	generate
		for(i5 = 16; i5 < 32; i5 = i5 + 1) begin : shift_block52
			Mux_1b_2to1 shift9(S4[i5-16], S4[i5], amt[4], S5[i5]);
		end
	endgenerate
	
	assign Out = S5;
	
endmodule
