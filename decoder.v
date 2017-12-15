`include "opcode.h"

module decoder(
	input clk,
	input wire[31:0]instr,
	output reg[4:0]rd,
	output reg[4:0]rs1,
	output reg[4:0]rs2,
	output reg[6:0]opCode,
	output reg[31:0]imm,
	output reg[2:0]fun3,
	output reg[6:0]fun7
	//output reg opleft,
	//output reg mux2,
	//output reg mux3,
	//output reg load
	//output reg jmp
	);


	always @ (*) begin

		rd<=instr[11:7];
		rs1<=instr[19:15];
		rs2<=instr[24:20];
//		opleft<=instr[30];
		opCode<=instr[14:12];
		
		case(instr[6:0])
			`OP_IMM: begin
				imm <= instr[31:20];
//				mux2 <= 1; mux3<=1; 
			end
			`OP_OP: begin
				imm <= instr[31:20];
//				mux2 <= 1; mux3<=0; 
			end
			`OP_LUI: begin
				imm<=instr[31:12];
//				mux2 <= 1; mux3<=1; 
			end
			`OP_AUIPC: begin
				imm<=instr[31:12];
//				mux2 <= 0; mux3<=1; 
			end
			`OP_JAL: begin
				imm<=instr[31:12];
//				mux2 <= 1; mux3<=1; 
			end
			`OP_JALR: begin
				imm<=instr[31:20];	
//				mux2 <= 1; mux3<=1; 
			end
			`OP_BRANCH: begin
				imm<= {instr[31:25],instr[11:7]};
//				mux2 <= 1; mux3<=1; 
			end
			`OP_LOAD: begin
				imm<= instr[31:20];
//				mux2 <= 1; mux3<=1; 
			end
			`OP_STORE: begin
				imm<= {instr[31:25],instr[11:7]};
//				mux2 <= 1; mux3<=1; 
			end
			`OP_MEM:
				$display("MEM mei xie");
			`OP_SYS:
				$display("SYS mei xie");
		endcase
	end

endmodule
