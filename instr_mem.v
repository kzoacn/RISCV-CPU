//`define MEM_SIZE 1024
//`define MEM_BIT 32

module instr_mem(
	input wire clk,
	input wire[31:0] adr,
	input wire load,
	input wire[31:0] in,
	output reg[31:0] out
	);

	parameter MEM_SIZE=1024;
	
	reg[31:0] mem[0:MEM_SIZE-1];
	integer i;

	initial begin
		for(i=0;i<MEM_SIZE;i=i+1)
			mem[i]=0;
		$readmemb("instr.bin",mem,0,0);

		
	end

	always @ (*) begin
		if(load) begin
			mem[adr]=in;
			out<=32'h00;
		end else begin
			out<=mem[adr];
		end
	end
	
//	assign mem[adr][31:0] = load ? in : 32'h00;
//	assign out = mem[adr][31:0];

endmodule
