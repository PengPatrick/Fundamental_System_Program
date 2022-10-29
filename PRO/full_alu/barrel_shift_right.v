module barrel_shift_right(A, amt, Out);

	input [31:0] A;
	input [4:0] amt;
	output [31:0] Out;
	
	// First Iteration
	wire sign;
	assign sign = A[31];
	wire [31:0] S1;
	Mux_1b_2to1 shift0(sign, A[31], amt[0], S1[31]);
	
	genvar i1;
	
	generate
		for(i1 = 31; i1 > 0; i1 = i1 - 1) begin : shift_block1
			Mux_1b_2to1 shift1(A[i1], A[i1 - 1], amt[0], S1[i1 - 1]);
		end
	endgenerate
	
	// Second Iteration
	wire [31:0] S2;
	Mux_1b_2to1 shift21(sign, S1[31], amt[1], S2[31]);
	Mux_1b_2to1 shift22(sign, S1[30], amt[1], S2[30]);
	genvar i2;
	
	generate
		for(i2 = 31; i2 > 1; i2 = i2 - 1) begin : shift_block2
			Mux_1b_2to1 shift3(S1[i2], S1[i2 - 2], amt[1], S2[i2 - 2]);
		end
	endgenerate
	
	
	// Third Iteration
	wire [31:0] S3;
	Mux_1b_2to1 shift41(sign, S2[31], amt[2], S3[31]);
	Mux_1b_2to1 shift42(sign, S2[30], amt[2], S3[30]);
	Mux_1b_2to1 shift43(sign, S2[29], amt[2], S3[29]);
	Mux_1b_2to1 shift44(sign, S2[28], amt[2], S3[28]);
	
	genvar i3;
	
	generate
		for(i3 = 31; i3 > 3; i3 = i3 - 1) begin : shift_block3
			Mux_1b_2to1 shift5(S2[i3], S2[i3-4], amt[2], S3[i3-4]);
		end
	endgenerate
	
	
	// Forth Iteration
	wire [31:0] S4;
	
	genvar j4;
	generate
		for(j4 = 31; j4 > 23; j4 = j4 - 1) begin : shift_block41
			Mux_1b_2to1 shift6(sign, S3[j4], amt[3], S4[j4]);
		end
	endgenerate

	genvar i4;
	
	generate
		for(i4 = 31; i4 > 7; i4 = i4 - 1) begin : shift_block42
			Mux_1b_2to1 shift7(S3[i4], S3[i4-8], amt[3], S4[i4-8]);
		end
	endgenerate
	
	// Final Iteration
	wire [31:0] S5;
	
	genvar j5;
	generate
		for(j5 = 31; j5 > 15; j5 = j5 - 1) begin : shift_block51
			Mux_1b_2to1 shift6(sign, S4[j5], amt[4], S5[j5]);
		end
	endgenerate

	genvar i5;
	
	generate
		for(i5 = 31; i5 > 15; i5 = i5 - 1) begin : shift_block52
			Mux_1b_2to1 shift9(S4[i5], S4[i5 - 16], amt[4], S5[i5 - 16]);
		end
	endgenerate
	
	assign Out = S5;
	
endmodule
