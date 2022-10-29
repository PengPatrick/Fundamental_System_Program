module isSame(A, B, Cout);
	
	input A, B;
	output Cout;
	
	wire C1, C2, C3;
	and and1(C1, ~A, ~B);
	and and2(C2, A, B);
	or or1(C3, C1, C2);
	
	assign Cout = C3;

endmodule
