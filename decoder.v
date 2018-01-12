`include "opcode.h"

module decoder(
	input wire clk,
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
    /*imm20_r     = {instr[31:12], 12'b0};
    
    imm12_r     = {{20{instr[31]}}, instr[31:20]};
    bimm_r      = {{19{instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};
    jimm20_r    = {{12{instr[31]}}, instr[19:12], instr[20], instr[30:25], instr[24:21], 1'b0};
    storeimm_r  = {{20{instr[31]}}, instr[31:25], instr[11:7]};
    shamt_r     = instr[24:20];*/
		rd<=instr[11:7];
		rs1<=instr[19:15];
		rs2<=instr[24:20];
//		opleft<=instr[30];
		opCode<=instr[6:0];
		fun3<=instr[14:12];
		fun7<=instr[31:25];
		case(instr[6:0])
			`OP_IMM: begin
				imm <= {{20{instr[31]}}, instr[31:20]};
//				mux2 <= 1; mux3<=1; 
			end
			`OP_OP: begin
				imm <= instr[31:20];
//				mux2 <= 1; mux3<=0; 
			end
			`OP_LUI: begin
				imm<={instr[31:12],12'b0 };
//				mux2 <= 1; mux3<=1; 
			end
			`OP_AUIPC: begin
				imm<={instr[31:12],12'b0 };
//				mux2 <= 0; mux3<=1; 
			end
			`OP_JAL: begin
				imm<= {{12{instr[31]}}, instr[19:12], instr[20], instr[30:25], instr[24:21], 1'b0};
//				mux2 <= 1; mux3<=1; 
			end
			`OP_JALR: begin
				imm<={{20{instr[31]}}, instr[31:20]};	
//				mux2 <= 1; mux3<=1; 
			end
			`OP_BRANCH: begin
				imm<=  {{19{instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};
//				mux2 <= 1; mux3<=1; 
			end
			`OP_LOAD: begin
				imm<= {{20{instr[31]}}, instr[31:20]};
//				mux2 <= 1; mux3<=1; 
			end
			`OP_STORE: begin
				imm<= {{20{instr[31]}}, instr[31:25], instr[11:7]};
//				mux2 <= 1; mux3<=1; 
			end
			`OP_MEM:
				$display("MEM mei xie");
			`OP_SYS:
				$display("SYS mei xie");
		endcase
	end

endmodule
