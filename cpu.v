`include "ram.v"
`include "alu.v"
`include "decoder.v"
`include "reg32.v"


module cpu(input clk);

	wire[31:0] ir,pc,instr;
	wire load_ins;

	ram instr_mem(.clk(clk),.adr(pc),.load(1'b0),.in(32'h00),.out(instr));


	wire opleft,_mux2,_mux3,load;
	wire[4:0] rd,rs1,rs2;
	wire[2:0] opCode;
	wire[31:0] imm;
	decoder dec(.clk(clk),.instr(instr),.rd(rd),.rs1(rs1),.rs2(rs2),.opCode(opCode),.imm(imm),.opleft(opleft),.mux2(_mux2),.mux3(_mux3),.load(load));

	wire [31:0] out1,out2,in;
	wire load;
	reg32 regm(.clk(clk),.rs1(rs1),.rs2(rs2),.out1(out1),.out2(out2),.load(load),.rd(rd),.in(in));

	wire [31:0] npc;
	alu pc_adder(.clk(clk),.reset(1'b0),.opleft(1'b1),.opCode(`ALU_ADDSUB),.rs1(pc),.rs2(32'h04),.res(npc));


	wire [31:0] alu0,mux2,mux3;

	assign mux2= _mux2==0 ? npc : out1;
	assign mux3= _mux3==0 ? $signed(imm) : out2;
	alu main_alu(.clk(clk),.reset(1'b0),.opleft(opleft),.opCode(opCode),.rs1(mux2),.rs2(mux3),.res(alu0));


	ram main_ram(.clk(clk),.adr(alu0),.load(),.in(in),.out(out));

endmodule
