`include "opcode.h"
`include "ram.v"
`include "alu.v"
`define RS_SIZE 3
// TODO rs_size -> 32
`define REG_SIZE 32


`define alu_link(i) assign alu[i].start=start[i]; \ 
	assign alu[i].fun7=fun7[i]; \
	assign alu[i].fun3=fun3[i]; \
	assign alu[i].rs1=vj[i]; \
	assign alu[i].rs2=vk[i]; \
	assign alu_busy[i]=alu[i].busy; \
	assign tres[i]=alu[i].res; \
	assign alu_done[i]=alu[i].done

	
//	assign alu[i].res=res[i];
//	assign alu[i].zero=zero[i]; \
//	assign alu[i].neg=neg[i]; \
//	assign alu[i].busy=alu_busy[i] 


module rsreg(
	input wire clk,
	input wire[6:0] _opcode,
	input wire[4:0] rd,
	input wire[2:0] _fun3,
	input wire[4:0] rs1,
	input wire[4:0] rs2,
	input wire[6:0] _fun7,
	input wire[31:0] _imm,
	input wire[31:0] opc,
	output wire[31:0] npc,
	output wire get_npc,
	output wire is_busy
	
	);

	//TODO NOP
	//TODO 
	assign is_busy = 1'b0;
	assign get_npc = 1'b0;
	wire[31:0] tres[0:`RS_SIZE];
	reg busy[0:`RS_SIZE],start[0:`RS_SIZE];
	wire alu_busy[0:`RS_SIZE],alu_done[0:`RS_SIZE];
	reg[6:0] opcode[0:`RS_SIZE];
	reg[2:0] fun3[0:`RS_SIZE];
	reg[6:0] fun7[0:`RS_SIZE];
	reg[31:0] vj[0:`RS_SIZE],vk[0:`RS_SIZE];
	reg[4:0] qj[0:`RS_SIZE],qk[0:`RS_SIZE],qi[0:`REG_SIZE];
	reg[31:0] A[0:`RS_SIZE],res[0:`RS_SIZE];
	reg[31:0] qreg[0:`REG_SIZE];
	reg[31:0] imm[0:`REG_SIZE];
	reg[31:0] que[0:`RS_SIZE];
	reg res_get[0:`RS_SIZE];
	alu alu[0:`RS_SIZE];


	`alu_link(1);
	`alu_link(2);


	reg mem_start,mem_load;
	reg[31:0] mem_adr,mem_in;
	wire[31:0] mem_out;
	wire mem_busy;

	ram mem(mem_start,mem_adr,mem_load,mem_in,mem_out,mem_busy);


	integer qhead,qtail,qsz,i;
	initial begin : init
		integer i;
		qhead=0;qtail=0;qsz=0;
		for(i=0;i<=`RS_SIZE;i=i+1) begin
			busy[i]=0;start[i]=0;
			opcode[i]=0;fun3[i]=0;
			fun7[i]=0;vj[i]=0;
			vk[i]=0;qk[i]=0;qj[i]=0;qi[i]=0;
			A[i]=0;res[i]=0;
			qreg[i]=0;
			imm[i]=0;que[i]=0;
			res_get[i]=0;
			//TODO clear
		end
	end


	always @ (posedge clk) begin
		//new cmd
		

		$display("opcode=%b",_opcode);
		$display("rd=%b",rd);
		$display("fun3=%b",_fun3);
		$display("rs1=%b",rs1);
		$display("rs2=%b",rs2);
		$display("fun7=%b",_fun7);
		$display("imm=%b",_imm);
		$display("opc=%b",opc);

		
		
		if((_opcode==`OP_IMM 
			&& _fun3==`ALU_ADDSUB 
			&& _fun7==7'b0000000
			&& _imm==32'h00) || _opcode==7'b0000000) begin
			//NOP do nothing
		end
		else begin : newcmd
			integer r,i;
			for(i=0;i<`RS_SIZE;i=i+1) begin
				if(!busy[i]) begin
					r=i;
				end
			end
			$display("r=%x",r);
//			r=que[qhead];
//			qhead=qhead&(32'h1f);
			if(_opcode==`OP_LOAD || _opcode==`OP_STORE) begin
				que[qtail]=r;
				qtail=(qtail+1)&(32'h1f);

				if(qi[rs1]==0) begin
					vj[r]=qreg[rs1];
					qj[r]=0;
				end else begin
					qj[r]=qi[rs1];
				end
				busy[r]=1;
				imm[r]=_imm;

				if(_opcode==`OP_LOAD) begin
					qi[rd]=r;
				end else begin
					if(qi[rs2]==0)begin
						vk[r]=qreg[rs2];
						qk[r]=0;
					end else begin
						qk[r]=qi[rs2];
					end
				end
			end
			else if(_opcode==`OP_BRANCH) begin
				if(qi[rs1]==0) begin
					vj[r]=qreg[rs1];
					qj[r]=0;
				end else begin
					qj[r]=qi[rs1];
				end
				busy[r]=1;
				imm[r]=_imm;
				if(qi[rs2]==0)begin
					vk[r]=qreg[rs2];
					qk[r]=0;
				end else begin
					qk[r]=qi[rs2];
				end

			end
			else begin
				if(_opcode==`OP_IMM)begin
					if(qi[rs1]==0) begin
						vj[r]=qreg[rs1];
						qj[r]=0;
					end else begin
						qj[r]=qi[rs1];
					end

					vk[r]=_imm;
					qk[r]=0;

					busy[r]=1;
					opcode[r]=_opcode;
					fun3[r]=_fun3;
					fun7[r]=_fun7;
					qi[rd]=r;
					
				end else begin
					if(qi[rs1]==0) begin
						vj[r]=qreg[rs1];
						qj[r]=0;
					end else begin
						qj[r]=qi[rs1];
					end
					if(qi[rs2]) begin
						vk[r]=qreg[rs2];
						qk[r]=0;
					end else begin
						qk[r]=qi[rs2];
					end

					busy[r]=1;
					opcode[r]=_opcode;
					fun3[r]=_fun3;
					fun7[r]=_fun7;
					qi[rd]=r;
				end
			end
		end
		//exec


$display("qreg[3]=%x",qreg[3]);
		for(i=1;i<`RS_SIZE;i=i+1)begin
			if(busy[i]) begin
				if(opcode[i]==`OP_LOAD)begin
					if(qj[i]==0&&i==que[qhead])begin
						vk[i]=imm[i];
						fun3[i]=`ALU_ADDSUB;
						fun7[i]=7'b0000000;
						start[i]=1;			
						if(!alu_busy[i])begin
							mem_adr=res[i];
							mem_load=0;
							mem_start=0;
							mem_start=1;
						end
					end
				end else
				if(opcode[i]==`OP_STORE)begin
					if(qj[i]==0&&i==que[qhead])begin
						A[i]=vk[i];
						vk[i]=imm[i];
						fun3[i]=`ALU_ADDSUB;
						fun7[i]=7'b0000000;
						start[i]=1;		
						if(!alu_busy[i])begin
							mem_adr=res[i];
							mem_in=A[i];
							mem_load=1;
							mem_start=0;
							mem_start=1;
						end
					end
				end else
				if(opcode[i]==`OP_BRANCH)begin
					if(qj[i]==0)begin
						//TODO
						case(fun3[i])
							`OP_BEQ:;
							`OP_BNE:;
							`OP_BLT:;
							`OP_BGE:;
							`OP_BLTU:;
							`OP_BGEU:;
						endcase

						start[i]=1;
					end
				end else begin
					if(qj[i]==0&&qk[i]==0) begin
						start[i]=1;
					end
				end

			end
		end

$display("qreg[3]=%x",qreg[3]);
		//write
		
		for(i=1;i<`RS_SIZE;i=i+1)begin
			if(busy[i]&&start[i]&&alu_done[i]) begin
				res[i]=tres[i];
				if(opcode[i]==`OP_LOAD)begin
					if(mem_start&&!mem_busy)begin
						res[i]=mem_out[i];
						res_get[i]=1;
					end
				end else
				if(opcode[i]==`OP_STORE)begin
					if(qj[i]==0&&i==que[qhead])begin
						res_get[i]=1;
					end
				end else
				if(opcode[i]==`OP_BRANCH)begin
					if(qj[i]==0)begin
						//TODO
						case(fun3[i])
							`OP_BEQ:;
							`OP_BNE:;
							`OP_BLT:;
							`OP_BGE:;
							`OP_BLTU:;
							`OP_BGEU:;
						endcase
						res_get[i]=1;
					end
				end else begin
					if(!alu_busy[i]) begin
						res_get[i]=1;
						$display("res=%x",res[i]);
						$display("tres=%x",tres[i]);
					end
				end
				
			end	
		end

$display("qreg[3]=%x",qreg[3]);
		for(i=0;i<`REG_SIZE;i=i+1)begin
			if(qi[i]!=0 && res_get[qi[i]])begin
				qreg[i]=res[qi[i]];
				qi[i]=0;
			end
		end
		for(i=1;i<`RS_SIZE;i=i+1)begin
			if(qj[i]!=0 && res_get[qj[i]])begin
				vj[i]=res[qj[i]];
				qj[i]=0;
			end
			if(qk[i]!=0 && res_get[qk[i]])begin
				vk[i]=res[qk[i]];
				qj[i]=0;
			end
		end



		for(i=1;i<`RS_SIZE;i=i+1)begin
			if(res_get[i]) begin
				busy[i]=0;
				start[i]=0;
				res_get[i]=0;
				qj[i]=0;qk[i]=0;

				if(i==que[qhead])begin
					qhead=(qhead+1)&(32'h1f);
				end
			end	
		end

		for(i=0;i<4;i=i+1)
			$display("reg[%x]=%x",i,qreg[i]);
		mem_start=0;
		mem_start=1;
	end

endmodule
