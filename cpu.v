//`include "instr_ctrl.v"
//`include "rsreg.v"


module cpu(input wire EXCLK,
			input wire rst,
			input wire Rx,
			output wire Tx
		);
		
	wire clk;
	//assign clk=EXCLK;
	clk_wiz_0 clkz(clk, EXCLK);
	integer cnt;
	/*always@(posedge EXCLK)begin
		cnt=cnt+1;
		if(cnt==1000)begin
			cnt=0;
			clk=~clk;
		end
	end*/
		

	wire[6:0] _opcode;
	wire[4:0] rd;
	wire[2:0] _fun3;
	wire[4:0] rs1;
	wire[4:0] rs2;
	wire[6:0] _fun7;
	wire[31:0] _imm;
	wire[31:0] opc,npc;
	wire is_busy,get_npc;

	parameter INS_SIZE=1;
	wire D_start;
	wire[31:0] D_adr;
	wire D_load;
	wire[31:0] D_in;
	wire[2:0] D_siz;
	wire[31:0] D_out;
	wire D_busy;
	wire D_done;
	wire D_deb;
	wire I_start;
	wire[31:0] I_adr;
	wire[31:0] I_out;
	wire I_busy;
	wire I_done;
	reg[1:0] counter;
	initial begin
		counter=0;
		//clk=0;
		cnt=0;
	end
	
	always @ (posedge clk or posedge rst)begin
		if(rst)begin
			counter<=0;
			//clk=0;
			cnt=0;
		end else begin
			counter <= counter + 1;
			if(counter==2'b11)begin
				counter<=0;
			end
		end
	end
	
	uart_memory 
		#(.INS_SIZE(INS_SIZE))
		mem(
	    .clk(clk),
	    .rst(rst),
	    .counter(counter),
		.D_start(D_start),
		.D_adr(D_adr),
		.D_load(D_load),
		.D_in(D_in),
		.D_siz(D_siz),
		.D_out(D_out),
		.D_busy(D_busy),
		.D_done(D_done),
		.D_deb(D_deb),
		.I_start(I_start),
		.I_adr(I_adr),
		.I_out(I_out),
		.I_busy(I_busy),
		.I_done(I_done),
		.Tx(Tx),
		.Rx(Rx)
		);
	
	instr_ctrl 
		#(.INS_SIZE(INS_SIZE))
		ic(
		.clk(clk),
		.rst(rst),
		.counter(counter),
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
		.opc(opc),
		.pc(I_adr),
		.mem_busy(I_busy),
		.mem_done(I_done),
		.tmp_instr(I_out),
		.I_start(I_start)
	);

	rsreg rg(
		.clk(clk),
		.rst(rst),
		.counter(counter),
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
		.is_busy(is_busy),
		.mem_start(D_start),
		.mem_load(D_load),
		.mem_deb(D_deb),
		.mem_adr(D_adr),
		.mem_in(D_in),
		.mem_out(D_out),
		.mem_busy(D_busy),
		.mem_done(D_done),
		.mem_siz(D_siz)
	);
	

endmodule
