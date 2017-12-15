//`define MEM_SIZE 1024
//`define MEM_BIT 32


`define DEBUG 1'b1
module ram(
	input wire start,
	input wire[31:0] adr,
	input wire load,
	input wire[31:0] in,
	output reg[31:0] out,
	output reg busy
	);

	parameter MEM_SIZE=1024;
	
	reg[31:0] mem[0:MEM_SIZE-1];
	integer i;

	initial begin
		busy=0;
		for(i=0;i<MEM_SIZE;i=i+1)
			mem[i]=0;
	end

	always @ (posedge start) begin
		if(!busy) begin
			busy=1;
			if(load) begin
				mem[adr]=in;
				out<=32'h00;
			end else begin
				out<=mem[adr];
			end
			busy=0;
		end

		if(`DEBUG==1'b1)begin
			for(i=0;i<5;i++)
				$display("mem[%x]=%x",i,mem[i]);
		end

	end
	
//	assign mem[adr][31:0] = load ? in : 32'h00;
//	assign out = mem[adr][31:0];

endmodule
