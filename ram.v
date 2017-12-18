//`define MEM_SIZE 1024
//`define MEM_BIT 32

`include "opcode.h"
`define DEBUG 1'b1
module ram(
	input wire start,
	input wire[31:0] adr,
	input wire load,
	input wire[31:0] in,
	input wire[2:0] siz,
	output reg[31:0] out,
	output reg busy,
	output reg done,
	input wire deb
	);

	parameter MEM_SIZE=4096;
	
	reg[7:0] mem[0:MEM_SIZE-1];
	integer i;


	initial begin
		busy=0;
		done=0;
		for(i=0;i<MEM_SIZE;i=i+1)
			mem[i]=8'b0;
	end
	

	always @ (posedge start) begin
		if(!busy) begin
			$display("load=%x",load);
			$display("adr=%x",adr);
			$display("in=%x",in);
			done=0;
			busy=1;
			if(load) begin
				if(siz==`MEM_BYTE)begin
					mem[adr]<=in[7:0];
				end
				if(siz==`MEM_HALF)begin
					mem[adr]<=in[7:0];
					mem[adr+1]<=in[15:8];
				end
				if(siz==`MEM_WORD)begin
					mem[adr]<=in[7:0];
					mem[adr+1]<=in[15:8];
					mem[adr+2]<=in[23:16];
					mem[adr+3]<=in[31:24];
				end
				out<=32'h0;
			end else begin
				if(siz==`MEM_BYTE)begin
					out[7:0]<=$signed(mem[adr]);
				end
				if(siz==`MEM_HALF)begin
					out[15:0]<=$signed({mem[adr+1],mem[adr]});
				end
				if(siz==`MEM_WORD)begin
					out<={mem[adr+3],mem[adr+2],mem[adr+1],mem[adr]};
				end
				if(siz==`MEM_BU)begin
					out[7:0]<=$unsigned(mem[adr]);
				end
				if(siz==`MEM_HU)begin
					out<=$unsigned({mem[adr+3],mem[adr+2],mem[adr+1],mem[adr]});
				end
			
			end
			$display("mem_out = %x",out);
			$display("mem_siz = %x",siz);
			busy=0;
			done=1;
		end
	end
	always @ (posedge deb)begin
		if(`DEBUG==1'b1)begin
			for(i=0;i<5*4;i++)
				$display("mem[%x]=%x",i,mem[i]);
		end

	end
	
//	assign mem[adr][31:0] = load ? in : 32'h00;
//	assign out = mem[adr][31:0];

endmodule
