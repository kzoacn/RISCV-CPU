//`define MEM_SIZE 1024
//`define MEM_BIT 32

`include "opcode.h"

module memory(
    input wire clk,
    input wire rst,
    input wire[1:0] counter,
	input wire D_start,
	input wire[31:0] D_adr,
	input wire D_load,
	input wire[31:0] D_in,
	input wire[2:0] D_siz,
	output reg[31:0] D_out,
	output reg D_busy,
	output reg D_done,
	input wire D_deb,
	input wire I_start,
    input wire[31:0] I_adr,
    output reg[31:0] I_out,
    output reg I_busy,
    output reg I_done,
    input wire Rx,
    input wire Tx
	);
	parameter INS_SIZE=1;
	parameter MEM_SIZE=4096*2;//TODO !!!
	
	reg[7:0] mem[0:MEM_SIZE-1];
	integer i;

    reg is_working,D_working,I_working;
	reg alternative;
	initial begin
		alternative=0;
		D_busy=0;
		D_done=0;
		is_working=0;
		for(i=0;i<MEM_SIZE;i=i+1)
			mem[i]=8'b0;
		
         I_done=0;
         I_busy=1;
         I_working=0;
	end
	
   /* always @ (I_adr) begin
        I_done=0;
        I_busy=1;
        I_working=0;
    end*/
    
    initial begin
    	//$readmemb("E:/CPU/simu/instr.bin",mem,0,0+INS_SIZE*4-1);
    	$readmemh("E:/CPU/simu/test.in",mem,0,0+INS_SIZE*4-1);
    	$display("mem[0]=%b",mem[0]);
    	$display("mem[1]=%b",mem[1]);
    	$display("mem[2]=%b",mem[2]);
    	$display("mem[3]=%b",mem[3]);
    	$display("mem[4]=%b",mem[4]);
    	$display("mem[5]=%b",mem[5]);
    	$display("mem[6]=%b",mem[6]);
    	$display("mem[7]=%b",mem[7]);
    end

	/*always @ (posedge D_start) begin
	   D_done=0;
	   D_busy=1;
	   D_working=0;
    end*/
    
    always@(posedge clk)begin
    	$display("at memory counter = ",counter);
    	
    	$display("I_start = ",I_start);
    	$display("I_busy = ",I_busy);
    	$display("I_done: %b",I_done);
    	$display("I_working = ",I_working);
    	 	
    	$display("D_start = ",D_start);
    	$display("D_busy = ",D_busy);
    	$display("D_done: %b",D_done);
    	$display("D_working = ",D_working);
    
    	if(counter==1)begin
    		if(D_start&&!D_busy)begin
    		   D_done=0;
    		   D_busy=1;
    		   D_working=0;
    		end
    		
    		if(I_start&&!I_busy)begin
    			I_done=0;
    			I_busy=1;
    			I_working=0;
    		end
    		
    	end
    	
        if(1)begin
        	alternative<=alternative^1;
        		
        	
            if(I_busy&&!I_working)begin
            	$display("working here");
            	I_working=1'b1;
            	#100;
            	I_out  <=   {mem[I_adr+3],mem[I_adr+2],mem[I_adr+1],mem[I_adr]};
                I_busy<=0;
                I_done<=1;
            end else 
            if(D_busy&&!D_working)begin
            	$display("start D mem");
            	$display("adr=",D_adr);
            	$display("load=",D_load);
            	$display("in=",D_in);
            	D_working=1'b1;
                if(D_load) begin
					  if(D_siz==`MEM_BYTE)begin
					  		mem[D_adr]<=D_in[7:0];
					  end else
					  if(D_siz==`MEM_HALF)begin
					  		mem[D_adr]<=D_in[7:0];
					  		mem[D_adr+1]<=D_in[15:8];
					  end else
					  if(D_siz==`MEM_WORD)begin
					  		mem[D_adr]<=D_in[7:0];
					  		mem[D_adr+1]<=D_in[15:8];
					  		mem[D_adr+2]<=D_in[23:16];
					  		mem[D_adr+3]<=D_in[31:24];
                      end
                      
                      if(D_adr==32'h104) begin
                      	$display("output %c",D_in[7:0]);
                      end
                      
                      D_out<=32'h0;
                     // D_working<=0;
               end else begin
               		if(D_siz==`MEM_BYTE)begin
               			D_out[7:0]<=$signed(mem[D_adr]);
               		end else
               		if(D_siz==`MEM_HALF)begin
               			D_out[15:0]<=$signed({mem[D_adr+1],mem[D_adr]});
               		end else
               		if(D_siz==`MEM_WORD)begin
               			D_out<={mem[D_adr+3],mem[D_adr+2],mem[D_adr+1],mem[D_adr]};
               		end else
               		if(D_siz==`MEM_BU)begin
               			D_out[7:0]<=$unsigned(mem[D_adr]);
               		end else
               		if(D_siz==`MEM_HU)begin
               			D_out<=$unsigned({mem[D_adr+3],mem[D_adr+2],mem[D_adr+1],mem[D_adr]});
               		end
               		//D_working<=0;
               	end
               	D_busy<=0;
               	D_done<=1;
            end
        end
		/*if(!D_busy) begin
			$display("load=%x",load);
			$display("adr=%x",adr);
			$display("in=%x",in);
			D_done=0;
			D_busy=1;
			$display("mem_out = %x",out);
			$display("mem_siz = %x",siz);
			D_busy=0;
			D_done=1;
		end*/
	end
	always @ (posedge D_deb)begin
		for(i=0;i<5*4;i=i+1)
			$display("mem[4096+%d]=%d",i,mem[4096+i]);

	end
	
//	assign mem[adr][31:0] = load ? in : 32'h00;
//	assign out = mem[adr][31:0];

endmodule
