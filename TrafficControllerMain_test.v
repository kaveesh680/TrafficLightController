`timescale 1ns / 1ps

module TrafficControllerMain_test;

	reg Reset;
	reg Sensor;
	reg Walk_Request;
	reg Reprogram;
	reg [1:0] Time_Parameter_Selector;
	reg [3:0] Time_Value;
	reg clk;

	wire [6:0] LEDs;
	
	
	TrafficControllerMain uut (
		.Reset(Reset), 
		.Sensor(Sensor), 
		.Walk_Request(Walk_Request), 
		.Reprogram(Reprogram), 
		.Time_Parameter_Selector(Time_Parameter_Selector), 
		.Time_Value(Time_Value), 
		.clk(clk), 
		.LEDs(LEDs)/*, //Visual pourpose only
		.start_timer(start_timer),
		.Reset_Sync(Reset_Sync),
		.expired(expired),
		.oneHz_enable(oneHz_enable),
		.value(value),
		.interval(interval)*/
	);

	initial begin
		Reset = 0;
		Sensor = 0;
		Walk_Request = 0;
		Reprogram = 0;
		Time_Parameter_Selector = 0;
		Time_Value = 0;
		clk = 0;
		#20
		// Wait 100 ns for global reset to finish
		#5
		Reset = 1;
		#5
		Reset = 0;
		//#100
		//walk request
		//Walk_Request = 1;
		//#20
		//Walk_Request = 0;
		// Vehicle sensor request
		//Sensor = 1;
		
		

        
		// Add stimulus here

	end
	
	initial begin
	forever begin
	 #5 clk = ~clk;
	end 
	end
	
      
endmodule

