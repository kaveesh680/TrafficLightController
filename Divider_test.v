`timescale 1ns / 1ps

module Divider_test;

	reg clk;
	reg rst;
	
	wire oneHz_enable;

	Divider uut (
		.rst(rst),
		.clk(clk), 
		.oneHz_enable(oneHz_enable)
	);


	initial begin 
	clk=0;
	rst=0;
	#20;
	rst=1;
	#20;
	rst=0;
	end
	
	initial begin
	forever begin
	 #5 clk = ~clk;
	end 
	end
      
endmodule

