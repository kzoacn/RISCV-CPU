`include "cpu.v"
module cpu_tb;
	reg clk;
	integer i;
	cpu cpu0(clk);
	initial begin
		$dumpfile("test.vcd");
		$dumpvars(0,cpu0);
		clk=0;
		for(i=0;i<25;i=i+1)begin
			#50 clk=~clk;
		end
	end
endmodule
