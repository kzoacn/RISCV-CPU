//`include "cpu.v"
`timescale 1ps/1ps
module cpu_tb;
	parameter INS_SIZE=1078;
	reg clk;
	integer i;
	integer sz;
	reg rst;
	wire Tx;
	reg Rx;
	cpu #(.INS_SIZE(INS_SIZE))  cpu0(clk,rst,Rx,Tx);
	integer counter;
	initial begin
		counter=0;
		clk=0;
		rst=0;
		Rx=0;
		for(i=0;i<8;i=i+1) begin
			#1000 clk=~clk;
			rst=1;
		end
		rst=0;
		
		//for(i=0;i<INS_SIZE*2000+1000;i=i+1)
		i=0;
		Rx=0;
		forever begin
			$display("clk is %d !!!!!!!!!",i);
			#1000 
			clk=~clk;
			/*
			if(clk)begin
				if(counter==0)Rx=1;
				if(counter==1)Rx=0;
				if(counter==2)Rx=1;
				if(counter==3)Rx=1;
				if(counter==4)Rx=1;
				if(counter==5)Rx=1;
				if(counter==6)Rx=1;
				if(counter==7)Rx=1;
				if(counter==8)Rx=1;
				if(counter==9)Rx=1;
				if(counter==10)Rx=0;
				if(counter==11)Rx=1;
				
				if(counter ==11)
					counter <=0;
				else
					counter <= counter +1;
			end*/
			i=i+1;
		end
	end
endmodule
