module read_port(ctrl_readReg, regName, data_readReg);
	
	input [31:0] regName [0:31];
	input [4:0] ctrl_readReg;
	output [31:0] data_readReg;
	
	wire [31:0] sel;
	
	decoder_5to32 decoder(ctrl_readReg, sel);
	
	genvar i;
	generate
	
	for(i = 0; i < 32; i = i + 1) begin:tristate
		tristate tri_s(regName[i], sel[i], data_readReg);
	end
	endgenerate

endmodule
