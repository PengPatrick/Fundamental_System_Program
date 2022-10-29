module rca(a,b,ci,Cout, Sum);
 input [3:0] a,b;
 input ci;
 output[3:0] Sum;
 output[3:0] Cout;
 wire[3:0] count;


 uf u0(a[0],b[0],ci,Sum[0],count[0]);
 uf u1(a[1],b[1],count[0],Sum[1],count[1]);
 uf u2(a[2],b[2],count[1],Sum[2],count[2]);
 uf u3(a[3],b[3],count[2],Sum[3],count[3]);
 
 assign Cout = count[3];

endmodule


module uf(A, B, Cin, Sum, Cout);
	input A, B, Cin;
	output Sum, Cout;
	
	wire X1;
	xor (X1, A, B);
	
	wire A1, A2;
	and (A1, A, B);
	and (A2, X1, Cin);
	
	wire F1, F2;
	xor (F1, X1, Cin);
	or (F2, A1, A2);
	
	assign Sum = F1;
	assign Cout = F2;
	
endmodule


