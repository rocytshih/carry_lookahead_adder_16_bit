`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 14:08:46
// Design Name: 
// Module Name: register_file_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module register_file_tb;

reg clk;
reg [31:0] instruction;
wire [31:0] M0;
wire [31:0] M1;
wire [31:0] M2;
wire [31:0] M3;
wire [31:0] M4;
wire [31:0] M5;
wire [31:0] M6;
wire [31:0] M7;
wire [31:0] R0;
wire [31:0] R1;
wire [31:0] R2;
wire [31:0] R3;

register_file register_file(.clk(clk), 
							.instruction(instruction),
							.M0(M0),		
							.M1(M1),
							.M2(M2),
							.M3(M3),
							.M4(M4),
							.M5(M5),
							.M6(M6),
							.M7(M7),
							.R0(R0),
							.R1(R1),
							.R2(R2),
							.R3(R3)
							);

// set up clk with 10000 ns period 100 Hz
parameter clkper = 10;
initial
	begin
		clk = 1;				// Time = 0
	end
always 
	begin
		#(clkper / 2)  clk = ~clk;
	end

initial
	begin
		#20;					
		instruction	= 32'b1000_0000_0000_0000_0000_0000_0000_0000;
		#20;					
		instruction	= 32'b1000_0000_0000_0001_0000_0001_0000_0000;
		#20;					
		instruction	= 32'b1000_0000_0000_0110_0000_0010_0000_0000;
		#20;					
		instruction	= 32'b1000_0000_0000_0111_0000_0011_0000_0000;
		#20;					
		instruction	= 32'b0100_0000_0000_0000_0000_0011_0000_0000;
		#20;					
		instruction	= 32'b0100_0000_0000_0001_0000_0010_0000_0000;
		#20;					
		instruction	= 32'b0100_0000_0000_0110_0000_0001_0000_0000;
		#20;					
		instruction	= 32'b0100_0000_0000_0111_0000_0000_0000_0000;
		#20;					
		instruction	= 32'b1000_0000_0000_0010_0000_0000_0000_0000;
		#20;					
		instruction	= 32'b1000_0000_0000_0011_0000_0001_0000_0000;
		#20;					
		instruction	= 32'b1000_0000_0000_0100_0000_0010_0000_0000;
		#20;					
		instruction	= 32'b1000_0000_0000_0101_0000_0011_0000_0000;
		#20;					
		instruction	= 32'b0100_0000_0000_0010_0000_0011_0000_0000;
		#20;					
		instruction	= 32'b0100_0000_0000_0011_0000_0010_0000_0000;
		#20;					
		instruction	= 32'b0100_0000_0000_0100_0000_0001_0000_0000;
		#20;					
		instruction	= 32'b0100_0000_0000_0101_0000_0000_0000_0000;
	end

endmodule
