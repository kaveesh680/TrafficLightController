`timescale 1ns / 1ps

module Divider(
    input clk,
	 input rst,
    output reg oneHz_enable
    );
	 
	 localparam [26:0] hz_constant = 27'd100_000_000;
	 reg [26:0]counter = hz_constant;
	 always@(posedge clk)
		begin
			if (rst) counter = hz_constant;
			else begin
				counter = counter - 1;
				oneHz_enable = (counter == 0);
				if (!counter) counter = hz_constant;
			end
		end


endmodule
