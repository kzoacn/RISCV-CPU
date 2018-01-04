`timescale 1ps/1ps
`include "opcode.h"
`include "ram.v"
`include "alu.v"
`define RS_SIZE 7
// TODO rs_size -> 32
`define REG_SIZE 32


`define alu_link(i) assign alu[i].start=start[i]; \ 
	assign alu[i].fun7=fun7[i]; \
	assign alu[i].fun3=fun3[i]; \
	assign alu[i].rs1=vj[i]; \
	assign alu[i].rs2=vk[i]; \
	assign alu_busy[i]=alu[i].busy; \
	assign tres[i]=alu[i].res; \
	assign alu_done[i]=alu[i].done; \
	assign alu_zero[i]=alu[i].zero; \
	assign alu_neg[i]=alu[i].neg

	
//	assign alu[i].res=res[i];
//	assign alu[i].zero=zero[i]; \
//	assign alu[i].neg=neg[i]; \
//	assign alu[i].busy=alu_busy[i] 



//$display("id=%x qi=%x qj=%x qk=%x vj=%x vk=%x opcode=%x ");


`define DEBUG for(i=0;i<4;i=i+1) \
			$display("qi[%x]=%x",i,qi[i]); \
		for(i=1;i<4;i=i+1) \
			$display("qj[%x]=%x",i,qj[i]); \
		for(i=1;i<4;i=i+1) \
			$display("vj[%x]=%x",i,vj[i]); \
		for(i=1;i<4;i=i+1) \
			$display("qk[%x]=%x",i,qk[i]); \
		for(i=1;i<4;i=i+1) \
			$display("vk[%x]=%x",i,vk[i]); \
		for(i=1;i<6;i=i+1) \
			$display("reg[%x]=%x",i,qreg[i]); \
		for(i=1;i<4;i=i+1) \
			$display("start[%x]=%x",i,start[i]); \
		for(i=1;i<4;i=i+1) \
			$display("fun7[%x]=%x",i,fun7[i]); \
		mem_deb=0; \
		mem_deb=1; \
		mem_deb=0; \
		$display("end")

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
	output reg[31:0] npc,
	output reg get_npc,
	output reg is_busy
	
	);

	wire[31:0] tres[0:`RS_SIZE];
	reg busy[0:`RS_SIZE],start[0:`RS_SIZE];
	wire alu_busy[0:`RS_SIZE],alu_done[0:`RS_SIZE],mem_done,alu_zero[0:`RS_SIZE],alu_neg[0:`RS_SIZE];
	reg[6:0] opcode[0:`RS_SIZE];
	reg[2:0] fun3[0:`RS_SIZE],brcode[0:`RS_SIZE];
	reg[6:0] fun7[0:`RS_SIZE];
	reg[31:0] vj[0:`RS_SIZE],vk[0:`RS_SIZE];
	reg[4:0] qj[0:`RS_SIZE],qk[0:`RS_SIZE],qi[0:`REG_SIZE];
	reg[31:0] A[0:`RS_SIZE],res[0:`RS_SIZE];
	reg[31:0] qreg[0:`REG_SIZE];
	reg[31:0] imm[0:`REG_SIZE];
	reg[31:0] que[0:32],tmp_pc;
	reg res_get[0:`RS_SIZE];
	alu alu[0:`RS_SIZE];


	`alu_link(1);
	`alu_link(2);
	`alu_link(3);
	`alu_link(4);
	`alu_link(5);
	`alu_link(6);
	`alu_link(7);


	reg mem_start,mem_load,mem_deb;
	reg[31:0] mem_adr,mem_in;
	wire[31:0] mem_out;
	wire mem_busy;
	reg[2:0] mem_siz;

	ram mem(mem_start,mem_adr,mem_load,mem_in,mem_siz,mem_out,mem_busy,mem_done,mem_deb);


	integer qhead,qtail,qsz,i;
	initial begin : init
		integer i;
		mem_start=1'b0;mem_load=1'b0;
		mem_adr=32'h0;mem_in=32'h0;
		mem_siz=`MEM_WORD;
		busy[0]=1'b1;
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
			start[i]=0;
			//TODO clear
		end
		for(i=0;i<=32;i=i+1)
			que[i]=0;
	end


	always @ (posedge clk) begin
		//new cmd
		#1;	
		get_npc=0;
		tmp_pc=opc;
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
			&& _imm==32'h00) || _opcode==7'b0000000 || is_busy) begin
			//NOP do nothing
		end
		else begin : newcmd
			integer r,i;
			r=666;
			for(i=`RS_SIZE-1;i>=1;i=i-1) begin
				$display("busy[%x]=%b",i,busy[i]);
				if(!busy[i]) begin
					r=i;
				end
			end
			$display("r=%x",r);
//			r=que[qhead];
//			qhead=qhead&(32'h1f);
			if(_opcode==`OP_LOAD || _opcode==`OP_STORE) begin
				opcode[r]=_opcode;
				que[qtail]=r;
				qtail=(qtail+1)&(32'h1f);
				fun7[r][2:0]=_fun3;
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
					qk[r]=0;
					vk[r]=_imm;
				end else begin
					if(qi[rs2]==0)begin
						vk[r]=qreg[rs2];
						qk[r]=0;
					end else begin
						qk[r]=qi[rs2];
					end
				end
			end
			else if(_opcode==`OP_LUI) begin
				opcode[r]=_opcode;
				busy[r]=1;
				qi[rd]=r;
				qj[r]=0;qk[r]=0;
				vj[r]=_imm;vk[r]=0;
			end
			else if(_opcode==`OP_AUIPC) begin
				
			end
			else if(_opcode==`OP_JAL) begin

			end
			else if(_opcode==`OP_JALR) begin

			end
			else if(_opcode==`OP_BRANCH) begin
				opcode[r]=_opcode;
				brcode[r]=_fun3;
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
					if(qi[rs2]==0) begin
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

		$display("after new cmd");
		`DEBUG;
		//exec

		$display("qhead=%x",qhead);
		$display("qtail=%x",qtail);
		for(i=qhead;i<qtail;i=i+1)
			$display("que[%x]=%x",i,que[i]);

		for(i=1;i<`RS_SIZE;i=i+1)begin
			if(busy[i]) begin
				$display("opcode=%b",opcode[i]);
				if(opcode[i]==`OP_LOAD)begin
					if(qj[i]==0&&i==que[qhead])begin
						if(!start[i])begin
							vk[i]=imm[i];
							fun3[i]=`ALU_ADDSUB;
							fun7[i][5]=1'b0;//7'b0000000;
						end
						if(start[i]&&!alu_busy[i]&&alu_done[i])begin
							$display("load memory qidong!");
							mem_adr=res[i];
							mem_siz=fun7[i][2:0];
							mem_load=0;
							mem_start=0;
							mem_start=1;	
						end
						start[i]=1;
					end
				end else
				if(opcode[i]==`OP_STORE)begin
					if(qj[i]==0&&qk[i]==0&&i==que[qhead])begin
						if(!start[i])begin
							A[i]=vk[i];
							vk[i]=imm[i];
							$display("vk[i]=%x",vk[i]);
							$display("imm[i]=%x",imm[i]);
							fun3[i]=`ALU_ADDSUB;
							fun7[i][5]=1'b0;//7'b0000000;
						end
						if(start[i]&&!alu_busy[i]&&alu_done[i])begin
							$display("store memory qidong!");
							mem_adr=res[i];
							mem_siz=fun7[i][2:0];
							mem_in=A[i];
							mem_load=1;
							mem_start=0;
							mem_start=1;
						end
						start[i]=1;
					end
				end 
				else if(opcode[i]==`OP_LUI) begin
					$display("LUI here");
					if(qj[i]==0&&qk[i]==0)begin
						if(!start[i])begin
							fun3[i]=`ALU_ADDSUB;
							fun7[i][5]=1'b0;
							start[i]=1;
							$display("LUI qidong!");
						end
					end
				end
				else if(opcode[i]==`OP_AUIPC) begin
				
				end
				else if(opcode[i]==`OP_JAL) begin

				end
				else if(opcode[i]==`OP_JALR) begin

				end else
				if(opcode[i]==`OP_BRANCH)begin
					if(qj[i]==0&&qk[i]==0&&!alu_busy[i]&&!start[i]) begin
						//TODO
						if(brcode[i][1]==1'b1&&brcode[i][2]==1'b1)begin
							if(brcode[i]==`OP_BLTU)begin
								fun3[i]=`ALU_SLTU;
							end else begin : tmper
								reg[2:0] tmp;
								tmp=vj[i];vj[i]=vk[i];vk[i]=tmp;
								fun3[i]=`ALU_SLTU;
							end
						end else begin
							fun3[i]=`ALU_ADDSUB;
							fun7[i]=7'b0100000;
						end
						$display("branch qidong!");
						start[i]=1;
					end
				end else begin
					if(qj[i]==0&&qk[i]==0&&!alu_busy[i]&&!start[i]) begin
						
						$display(" %x start calc vj %x vk %x",i,vj[i],vk[i]);
						start[i]=1;
					end
				end

			end
		end

		#1;
		$display("after exec");
		`DEBUG;
		//write
		
		for(i=1;i<`RS_SIZE;i=i+1)begin
			if(busy[i]&&start[i]&&alu_done[i]&&!alu_busy[i]) begin
				res[i]=tres[i];
				if(opcode[i]==`OP_LOAD)begin
					if(qj[i]==0&&mem_start&&!mem_busy&&mem_done&&i==que[qhead])begin
						res[i]=mem_out;
						res_get[i]=1;
						$display("load done");
					end
				end else
				if(opcode[i]==`OP_STORE)begin
					if(qj[i]==0&&mem_start&&!mem_busy&&mem_done&&i==que[qhead])begin
						res_get[i]=1;
						$display("store done");
					end
				end 
				else if(opcode[i]==`OP_LUI) begin
					if(!alu_busy[i]&&alu_done[i]) begin
						res_get[i]=1;
						$display("LUI %x get res",i);
						$display("res=%x",res[i]);
						$display("tres=%x",tres[i]);
					end
				end
				else if(opcode[i]==`OP_AUIPC) begin
				
				end
				else if(opcode[i]==`OP_JAL) begin

				end
				else if(opcode[i]==`OP_JALR) begin

				end else
				if(opcode[i]==`OP_BRANCH)begin
					if(!alu_busy[i]&&alu_done[i]) begin
						//TODO
						case(brcode[i])
							`OP_BEQ:res[i]=alu_zero[i];
							`OP_BNE:res[i]=!alu_zero[i];
							`OP_BLT:res[i]=alu_neg[i];
							`OP_BGE:res[i]=(!alu_neg[i])&(!alu_zero[i]);
							`OP_BLTU:res[i]=tres[i];
							`OP_BGEU:res[i]=tres[i];
						endcase
						$display("brach jump = %x",res[i]);
						res_get[i]=1;
					end
				end else begin
					if(!alu_busy[i]&&alu_done[i]) begin
						res_get[i]=1;
						$display("%x get res",i);
						$display("res=%x",res[i]);
						$display("tres=%x",tres[i]);
					end
				end
				
			end	
		end

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
				qk[i]=0;
			end
		end

		$display("opc=%x",npc);
		npc=tmp_pc+4;


		for(i=1;i<`RS_SIZE;i=i+1)begin
			if(res_get[i]) begin
				if(opcode[i]==`OP_BRANCH)begin
					if(res[i])begin
						npc=npc-4+imm[i];
						$display("add %x to pc",imm[i]);
					end
					else begin
//						npc=npc;
					end
				end
				busy[i]=0;
				start[i]=0;
				res_get[i]=0;
				qj[i]=0;qk[i]=0;
				start[i]=0;
				if(qhead!=qtail&&i==que[qhead])begin
					qhead=(qhead+1)&(32'h1f);
				end
			end	
		end
		get_npc=1;
		is_busy=1'b1;
		for(i=1;i<`RS_SIZE;i=i+1)begin
			if(!busy[i])begin
				is_busy=1'b0;
			end
		end
		if(is_busy)
			npc=tmp_pc;

		$display("npc=%x",npc);
		$display("after write");
		`DEBUG;
		mem_start=0;
		
	end

endmodule
