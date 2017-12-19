`include "cpu.v"
`timescale 1ns/1ps
module cpu_tb;
	parameter INS_SIZE=2000;
	reg clk;
	integer i;
	integer sz;
	cpu #(.INS_SIZE(INS_SIZE))  cpu0(clk);
	initial begin
		$dumpfile("test.vcd");
		$dumpvars(0,cpu0);
		clk=0;
		for(i=0;i<5+INS_SIZE*40;i=i+1)begin
			$display("clk is %d !!!!!!!!!",i);
			#50 clk=~clk;
		end
	end
endmodule
