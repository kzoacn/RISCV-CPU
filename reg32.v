module reg32(
	input clk,
	input [4:0]rs1,
	input [4:0]rs2,
	output reg [31:0] out1,
	output reg [31:0] out2,
	input load,
	input [4:0]rd,
	input [31:0] in
	);

	reg[31:0] regs[0:31];
	integer i;
	initial begin
		for(i=0;i<32;i=i+1)
			regs[i]=0;
	end
	
	always @ (posedge clk) begin
		if(load) begin
			regs[rd]<=in;	
		end else begin
			out1<=regs[rs1];
			out2<=regs[rs2];
		end
	end

endmodule
