`include "opcode.h"

module alu(
	input clk,
	input reset,
	input opleft,
	input [2:0] opCode,
	input [31:0] rs1,
	input [31:0] rs2,
	output reg [31:0] res,
	output reg zero,
	output reg neg
	);
	
	always @(posedge clk or posedge reset) begin
		if(reset) begin
			res <= 0;
			zero<=0;
			neg<=0;
		end else begin
			case(opCode)
			`ALU_ADDSUB:res <= opleft?rs1+rs2:rs1-rs2;
			`ALU_AND:	res <= rs1&rs2;
			`ALU_OR:	res <= rs1|rs2;
			`ALU_XOR:	res <= rs1^rs2;
			`ALU_SLL:	res <= rs1<<rs2;
			`ALU_SRLA:	res <= opleft? rs1 >> rs2 : $signed(rs2) >>> rs1;
			`ALU_SLT:	res <= $signed(rs1) < $signed(rs2) ? 32'b1 : 32'b0;
			endcase
			zero <= res==0? 1'b1:1'b0;
			neg <= res<0 ? 1'b1:1'b0;
		end
	end
endmodule
