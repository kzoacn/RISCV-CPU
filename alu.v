`include "opcode.h"

module alu(
	input start,
	input [6:0] fun7,
	input [2:0] fun3,
	input [31:0] rs1,
	input [31:0] rs2,
	output reg [31:0] res,
	output reg zero,
	output reg neg,
	output reg busy,
	output wire done
	);

	reg _done;

	assign done=_done;
	initial begin
		busy=0;_done=0;
	end
	always @(posedge start) begin
		if(!busy) begin
			$display("fun3=%b",fun3);
			$display("fun7=%b",fun7);
			$display("rs1=%b",rs1);
			$display("rs2=%b",rs2);
			busy=1;
			_done=0;
			case(fun3)
			`ALU_ADDSUB:res = fun7[5]==1'b0 ?rs1+rs2:rs1-rs2;
			`ALU_AND:	res = rs1&rs2;
			`ALU_OR:	res = rs1|rs2;
			`ALU_XOR:	res = rs1^rs2;
			`ALU_SLL:	res = rs1<<rs2;
			`ALU_SRLA:	res = fun7[5]==1'b0 ? rs1 >> rs2 : $signed(rs2) >>> rs1;
			`ALU_SLT:	res = $signed(rs1) < $signed(rs2) ? 32'b1 : 32'b0;
			`ALU_SLTU:	res = $unsigned(rs1) < $unsigned(rs2) ? 32'b1 : 32'b0;
			endcase
			zero= res==0? 1'b1:1'b0;
			neg = res<0 ? 1'b1:1'b0;
			busy=0;
		$display("done is not 1 here");
			_done=1;
		$display("alu res=%x busy=%d",res,busy);
		end
	end
	always @ (negedge start)begin
		_done=0;
	end
endmodule
/*
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
endmodule*/
