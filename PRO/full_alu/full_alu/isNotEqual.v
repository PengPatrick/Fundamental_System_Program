module isNotEqual(A, B, Out);
	input [31:0] A, B;
	output Out;
	
	wire [31:0] C1;
	genvar i1;
	
	generate
		for(i1 = 0; i1 < 32; i1 = i1 + 1) begin : xnor1
			xnor xnor1(C1[i1], A[i1], B[i1]);
		end
	endgenerate
	
	genvar j;
	
	wire [31:0] equal;
	
	and and1(equal[0], C1[1], C1[0]);
	generate
		for(j = 1; j < 31; j = j + 1) begin : and2
			and and3(equal[j], C1[j + 1], equal[j - 1]);
		end
	endgenerate
	
	assign Out = equal[30] ? 0 : 1;

endmodule
