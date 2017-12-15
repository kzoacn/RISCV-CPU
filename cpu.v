`include "instr_ctrl.v"
`include "rsreg.v"


module cpu(input clk);

	wire[6:0] _opcode;
	wire[4:0] rd;
	wire[2:0] _fun3;
	wire[4:0] rs1;
	wire[4:0] rs2;
	wire[6:0] _fun7;
	wire[31:0] _imm;
	wire[31:0] opc,npc;

	instr_ctrl ic(
		.clk(clk),
		.npc(npc),
		.get_npc(get_npc),
		.is_busy(is_busy),
		.opcode(_opcode),
		.rd(rd),
		.fun3(_fun3),
		.rs1(rs1),
		.rs2(rs2),
		.fun7(_fun7),
		.imm(_imm),
		.opc(opc)
	);

	rsreg rg(
		.clk(clk),
		._opcode(_opcode),
		.rd(rd),
		._fun3(_fun3),
		.rs1(rs1),
		.rs2(rs2),
		._fun7(_fun7),
		._imm(_imm),
		.opc(opc),
		.npc(npc),
		.get_npc(get_npc),
		.is_busy(is_busy)
	);

	

endmodule
