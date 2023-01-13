`timescale 1ns / 1ps

module FSM(
    input Sensor_Sync,
    input WR,
    output reg WR_Reset,
    output reg [6:0] LEDs,
    output reg [1:0] interval,
    output reg start_timer,
    input expired,
    input Prog_Sync,
	 input Reset_Sync,
	 input clk
    );
	 
	 localparam tbase = 2'b00,//tBASE
					textended = 2'b01,//tEXT
					tyellow = 2'b10,//tYEL
					tbasex2 = 2'b11;//2*tBASE
					
	 reg deviate; 
	 reg checkSensor_sync;
	 
	 localparam S1 = 7'b0011000, //Main green and side red
					S2 = 7'b0101000, //Main yellow and side red
					S3 = 7'b1000010, //Side green and main red
					S4 = 7'b1000100, //Side yellow and main red
					S5 = 7'b1001001; //walk, main and side red
	 
	 always@(posedge clk) 
		begin
		
		start_timer = 0;
		if (Prog_Sync | Reset_Sync) begin
			LEDs = S1;
			interval = tbasex2;
			WR_Reset = 0;
			start_timer = 1;
			checkSensor_sync = 1;
			end
		if (expired) 
			begin
				case (LEDs)
					S1: begin
							if (deviate) begin
								if (Sensor_Sync & checkSensor_sync)begin
									LEDs = S1;
									interval = textended;
									start_timer = 1;
									checkSensor_sync = 0;
 								end
								else begin
									LEDs = S1;
									interval = tbase;
									start_timer = 1;
								end
								deviate = 0;
							end
							
							else begin	
								LEDs = S2;
								interval = tyellow;
								start_timer = 1;
							end
						end
					
					S2:	begin
							if (WR) begin
								LEDs = S5;
								interval = textended;
								start_timer = 1;
								WR_Reset = 1;
							end
							else begin
								LEDs = S3;
								interval = tbase;
								start_timer = 1;
							end
							checkSensor_sync = 1;
						end
					S3: begin
							if (Sensor_Sync & checkSensor_sync) begin
								LEDs = S3;
								interval = textended;
								start_timer = 1;
								checkSensor_sync = 0;
							end
							else begin
								LEDs = S4;
								interval = tyellow;
								start_timer = 1;
								checkSensor_sync = 1;
							end
						end
					S4: begin
							LEDs = S1;
							interval = tbase;
							start_timer = 1;
							deviate = 1;
							checkSensor_sync = 1;
						end
					S5: begin
							LEDs = S3;
							interval = tbase;
							start_timer = 1;
							WR_Reset = 0;
						end
					default : 
							begin
							LEDs = S1;
							interval = tbase;
							deviate = 1;
							start_timer = 1;
							end
				endcase
		
		end
		end
	
	

endmodule
