module Mux_32b_4to1(in0, in1, in2, in3, sel, Out);
	
	input [31:0] in0, in1, in2, in3;
	input [1:0] sel;
	output [31:0] Out;
	
	wire [31:0] first_res, second_res;
	
	Mux_32b_2to1 mux1(in0, in1, sel[0], first_res);
	Mux_32b_2to1 mux2(in2, in3, sel[0], second_res);
	Mux_32b_2to1 mux_res(first_res, second_res, sel[1], Out);


endmodule
