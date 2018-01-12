//`define MEM_SIZE 1024
//`define MEM_BIT 32

module instr_mem(
	input wire clk,
	input wire[3:0] counter,
	input wire[31:0] adr,
	input wire load,
	input wire[31:0] in,
	output reg[31:0] out,
	output reg done
	);

	parameter MEM_SIZE=28000;
	parameter INS_SIZE=1;
	reg[31:0] mem[0:MEM_SIZE-1];
	integer i;
	integer num,fp;

	initial begin
		done=1;
		for(i=0;i<MEM_SIZE;i=i+1)
			mem[i]=0;
		//$readmemh("instr_num.bin",num);
		//$display("num=%x",num);
		$readmemb("E:/CPU/simu/instr.bin",mem,0,0+INS_SIZE-1);
		//$readmemh("E:/CPU/RISCV-CPU/test.in",mem,0,0+INS_SIZE-1);
		//$readmemh("E:\\CPU\\RISCV-CPU\\test.in",mem,0,0+INS_SIZE-1);
        $display("mem[0]=%b",mem[0]);
		out=32'h0;
	end

	always @ (*) begin
		if(done)begin
			done=0;
			if(load) begin
				mem[adr/4]=in;
				out<=32'h00;
			end else begin
				out<=mem[adr/4];
			end
			done=1;
		end
	end
	
//	assign mem[adr][31:0] = load ? in : 32'h00;
//	assign out = mem[adr][31:0];

endmodule
