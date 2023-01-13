`timescale 1ns / 1ps

 module TimeParameter(
    input [1:0] Selector,
    input [3:0] Time_value,
    input Prog_Sync,
	 input [1:0] interval,
	 input clk,
    output reg [3:0] value
    );
	 
	 reg[3:0] tbase = 4'b0110, // interval value = 00
				 textended = 4'b0011, // interval value = 01
				 tyellow = 4'b0010; // interval value = 10
	     
						 
	always@(posedge clk) begin
	
	case (interval)
		
		2'b00: value = tbase;
		2'b01: value = textended;
		2'b10: value = tyellow;
		2'b11: value = 2*tbase;
	
	endcase

	if (Prog_Sync) begin
		case (Selector) 
			2'b00: begin
						tbase = 4'b0110; // interval value = 00
						textended = 4'b0011; // interval value = 01
						tyellow = 4'b0010; // interval value = 10
					 end
			2'b01: tbase = Time_value;
			2'b10: textended = Time_value;
			2'b11: tyellow = Time_value;
		endcase
	end
		
	end

	

endmodule
