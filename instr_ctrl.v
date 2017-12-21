`include "instr_mem.v"
`include "decoder.v"

`timescale 1ps / 1ps
module instr_ctrl(
	input wire clk,
	input wire[31:0] npc,
	input wire get_npc,
	input wire is_busy,
	output wire[6:0] opcode,
	output wire[4:0] rd,
	output wire[2:0] fun3,
	output wire[4:0] rs1,
	output wire[4:0] rs2,
	output wire[6:0] fun7,
	output wire[31:0] imm,
	output wire[31:0] opc
	);

	parameter INS_SIZE=1;
	reg[31:0] pc,instr;
	reg is_fetch;
	wire done;
	wire[31:0] tmp_instr;
	
	instr_mem 
		#(.INS_SIZE(INS_SIZE))
		instr_mem(
		.clk(clk),
		.adr(pc),
		.load(1'b0),
		.in(32'h00),
		.out(tmp_instr),
		.done(done)
	);
	decoder decode(
		.clk(clk),
		.instr(tmp_instr),
		.rd(rd),
		.rs1(rs1),
		.rs2(rs2),
		.opCode(opcode),
		.imm(imm),
		.fun3(fun3),
		.fun7(fun7)
	);



	
	initial begin
		pc=32'h00;
		is_fetch=1'b1;
		instr=32'h00;
	end

	assign opc=pc;
	always @ (posedge clk) begin

		instr=32'h00;
		$display("before");
		$display("is_fetch: %d",is_fetch);
		$display("instr : %b",instr);
		$display("pc : %b",pc);
		$display("is_busy : %b",is_busy);
		$display("end");
		if(is_fetch==1'b1) begin
			if(!is_busy&&done) begin
				instr=tmp_instr;
				#1;
				if(opcode==`OP_BRANCH) begin
					is_fetch=1'b0;
				end
				pc=pc+4;
			end
			else begin
				instr=`OP_NOP;
				pc=pc;
			end
		end
		else begin
			$display("npc=%b",npc);
			$display("get_npc=%b",npc);
			if(get_npc) begin
				is_fetch=1'b1;
				pc=npc;
			end
		end
		$display("is_fetch: %d",is_fetch);
		$display("instr : %b",instr);
		$display("pc : %b",pc);
		$display("is_busy : %b",is_busy);
	end
	
endmodule
