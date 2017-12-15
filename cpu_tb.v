`timescale 1ns / 1ps

`include "cpu.v"
module cpu_tb;
	reg clk;
	integer i;
	cpu cpu(clk);
	initial begin
		clk=0;
		for(i=0;i<5;i=i+1)begin
			#10 clk=~clk;
		end
	end
endmodule
