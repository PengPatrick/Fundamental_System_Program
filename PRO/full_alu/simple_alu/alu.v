module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);
//module alu(data_operandA, data_operandB, ctrl_ALUopcode, data_result, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;

   // YOUR CODE HERE //
	wire C1, C2;
	wire [31:0] S1, S2;
	wire O1;
	
	// According to the option code to choose the add or sub
	assign S1 = ctrl_ALUopcode[0] ? ~data_operandB : data_operandB;
	assign C1 = ctrl_ALUopcode[0] ? 1'd1 : 1'd0;
	
	// CSA implemented in CSA.v. 
	CSA csa1(data_operandA, S1, C1, S2, O1, C2);
	
	/*   Truth table to check the overflow   */
	/*
	wire C3, C4, O2;
	and and1(C3, ~data_operandA[31], ~S1[31], S2[31]);
	and and2(C4, data_operandA[31], S1[31], ~S2[31]);
	or or1(O2, C3, C4);
	
	wire C5, C6, O3;
	and and3(C5, ~data_operandA[31], S1[31], S2[31]);
	and and4(C6, data_operandA[31], ~S1[31], ~S2[31]);
	or or2(O3, C5, C6);
	
	assign overflow = ctrl_ALUopcode[0] ? C3 : C2;
	*/
	
	assign data_result = S2;
	xor xor1(overflow, O1, C2);
	
endmodule
