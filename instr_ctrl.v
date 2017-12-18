`include "instr_mem.v"
`include "decoder.v"


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
		pc=32'h00;
		is_fetch=1'b1;
		instr=32'h00;
	end

	always @ (posedge clk) begin

		$display("is_fetch: %d",is_fetch);
		$display("instr : %b",instr);
		$display("pc : %b",pc);
		instr=32'h00;
		if(is_fetch) begin
			if(!is_busy&&done) begin
				instr<=tmp_instr;
				pc<=pc+4;
				if(opcode==`OP_BRANCH) begin
					is_fetch<=1'b0;
				end
			end
			else begin
				instr<=`OP_NOP;
				pc<=pc;
			end
		end
		else begin
			instr<=`OP_NOP;
			if(get_npc) begin
				is_fetch<=1'b1;
				pc<=npc;
			end
		end
	end
	
endmodule
