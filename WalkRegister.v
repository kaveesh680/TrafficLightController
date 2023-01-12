`timescale 1ns / 1ps

module WalkRegister(
    input WR_Sync,
    input WR_Reset,
    output reg WR
    );
	 
	 always@(posedge WR_Sync ,posedge WR_Reset) begin
//		if (WR_Sync) WR = 1;
//		if (WR_Reset) WR = 0;
		if (WR_Sync) begin
		  WR = 1;
		end
		else begin
		  if (WR_Reset) begin
		      WR = 0;
		  end      
	    end
	  end
endmodule

