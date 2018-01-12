//`include "instr_mem.v"
//`include "decoder.v"

`timescale 1ps / 1ps
module instr_ctrl(
	input wire clk,
	input wire rst,
	input wire[1:0] counter,
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
	output wire[31:0] opc,
	output reg[31:0] pc,
	input wire mem_busy,
	input wire mem_done,
	input wire[31:0] tmp_instr,
	output reg I_start,
	output reg done
	);

	parameter INS_SIZE=1;
	wire[31:0] instr;
	reg is_fetch;
	//reg I_start;
	/*
	instr_mem 
		#(.INS_SIZE(INS_SIZE))
		instr_mem(
		.clk(clk),
		.adr(pc),
		.load(1'b0),
		.in(32'h00),
		.out(tmp_instr),
		.done(done)
	);*/
	decoder decode(
		.clk(clk),
		.instr(instr),
		.rd(rd),
		.rs1(rs1),
		.rs2(rs2),
		.opCode(opcode),
		.imm(imm),
		.fun3(fun3),
		.fun7(fun7)
	);



	
	initial begin

	end

	assign opc=pc;

	/*always @ (posedge get_npc) begin
		if(!is_fetch)begin
			$display("getnpc change pc");
			pc=npc;
		end
	end*/

	//always @ (pc) begin
	//	$display("pc change herer");
	//end

    assign instr=( counter==0 &&is_fetch&&!is_busy&&!mem_busy&&mem_done) ? tmp_instr : `OP_NOP;

	

	always @ (posedge clk or posedge rst) begin
		if(rst)begin
			pc=32'h00;
			is_fetch=1'b1;
			I_start=1'b1;
			done=0;
		end else begin
		if(counter==0)begin
			$display("pc : %d",pc);
			$display("mem_busy : %b",mem_busy);
			$display("mem_done : %b",mem_done);
			if(is_fetch==1'b1) begin
				if(!is_busy&&!mem_busy&&mem_done) begin
					$display("get instr: %b",tmp_instr);
					$display("get opcode: %b",opcode);
					if(opcode==`OP_BRANCH || opcode==`OP_JAL || opcode==`OP_JALR) begin
						is_fetch<=1'b0;
						pc<=pc;
						I_start<=1'b0;
						$display("fetch change to 0");
					end else begin
						pc<=pc+4;
						I_start<=1'b1;
					end
				end
				else begin
					I_start<=1'b0;
				end
			end
			else begin
				$display("npc=%b",npc);
				$display("get_npc=%b",npc);
				if(get_npc) begin
					is_fetch=1'b1;
					pc=npc;
					I_start<=1'b1;
				end else begin
					I_start<=1'b0;
				end
			end
			$display("is_fetch: %d",is_fetch);
			$display("instr : %b",instr);
			$display("pc : %b",pc);
			$display("is_busy : %b",is_busy);
		end
	end end
/*
	always @ (negedge clk)begin

		if(opcode==`OP_BRANCH || opcode==`OP_AUIPC || opcode==`OP_JAL || opcode==`OP_JALR) begin
			is_fetch=1'b0;
		end
	end*/
	
	
endmodule
