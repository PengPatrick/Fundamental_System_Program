module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);
//module alu(data_operandA, data_operandB, ctrl_ALUopcode, data_result, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;

   // YOUR CODE HERE //
	//wire C1, C2;
	//wire [31:0] S1, S2;
	//wire O1;
	
	wire [31:0] add_res, sub_res, and_res, or_res, sll_res, sra_res;
	wire add_of, sub_of, add_cout, sub_cout;
	
	// According to the option code to choose the add or sub
	//assign S1 = ctrl_ALUopcode[0] ? ~data_operandB : data_operandB;
	//assign C1 = ctrl_ALUopcode[0] ? 1'd1 : 1'd0;
	
	// CSA implemented in CSA.v. 
	//CSA csa1(data_operandA, S1, C1, S2, O1, C2);
	CSA add(data_operandA, data_operandB, 1'd0, add_res, add_of, add_cout);
	CSA sub(data_operandA, ~data_operandB, 1'd1, sub_res, sub_of, sub_cout);
	bitwise_and bitAnd(data_operandA, data_operandB, and_res);
	bitwise_or bitOr(data_operandA, data_operandB, or_res);
	barrel_shift_left sll(data_operandA, ctrl_shiftamt, sll_res);
	barrel_shift_right sra(data_operandA, ctrl_shiftamt, sra_res);
	
	Mux_32b_8to1 mux8(32'd0, 32'd0, sra_res, sll_res, or_res, and_res, sub_res, add_res, ctrl_ALUopcode[2:0], data_result);
	
	//assign data_result = ;
	// check overflow
	wire o1, o2;
	xor xor_add(o1, add_of, add_cout);
	xor xor_sub(o2, sub_of, sub_cout);
	assign overflow = ctrl_ALUopcode[0] ? o2: o1;
	// check isLessThan
	xor xor1(isLessThan, sub_res[31], o2);
	// check isNotEqual
	isNotEqual ine(data_operandA,data_operandB, isNotEqual);
	
endmodule
