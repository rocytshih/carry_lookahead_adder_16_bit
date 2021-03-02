`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 12:39:36
// Design Name: 
// Module Name: register_file
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


module register_file(
	input clk,
	input [31:0] instruction,
	output [31:0] M0,
	output [31:0] M1,
	output [31:0] M2,
	output [31:0] M3,
	output [31:0] M4,
	output [31:0] M5,
	output [31:0] M6,
	output [31:0] M7,
	output [31:0] R0,
	output [31:0] R1,
	output [31:0] R2,
	output [31:0] R3
    );
wire [31:0] M0, M1, M2, M3, M4, M5, M6, M7;
wire [31:0] R0, R1, R2, R3;

assign M0 = memory_data[0];
assign M1 = memory_data[1];
assign M2 = memory_data[2];
assign M3 = memory_data[3];
assign M4 = memory_data[4];
assign M5 = memory_data[5];
assign M6 = memory_data[6];
assign M7 = memory_data[7];

assign R0 = register_data[0];
assign R1 = register_data[1];
assign R2 = register_data[2];
assign R3 = register_data[3];

reg [31:0] memory_data [7:0];
/*Initial the memory data*/
initial
	begin
		memory_data[0] = 32'h0;
		memory_data[1] = 32'h1;
		memory_data[2] = 32'h2;
		memory_data[3] = 32'h3;
		memory_data[4] = 32'h4;
		memory_data[5] = 32'h5;
		memory_data[6] = 32'h6;
		memory_data[7] = 32'h7;
	end
reg [31:0] register_data [3:0];
/*Initial the register data*/
initial
	begin
		register_data[0] = 32'h0;
		register_data[1] = 32'h0;
		register_data[2] = 32'h0;
		register_data[3] = 32'h0;
	end 

/*instruction point to register array number*/
wire [7:0] register_num;
assign register_num = instruction[15:8];
/*instruction point to memory array number*/
wire [7:0] memory_num;
assign memory_num = instruction[23:16];

	// begin
		// reg_register_data_sel <= register_data_sel;
		// reg_memory_data_sel <= memory_data_sel;
	// end
	
always@(posedge clk)
	begin
		case(instruction[31:30])
			2'b10: /* load memory data to register */
				begin
					register_data[register_num] <= memory_data[memory_num];
				end
			2'b01: /* store register data to memory */
				begin
					memory_data[memory_num] <= register_data[register_num];
				end
			default: /* unchange */
				begin
					register_data[register_num] <= register_data[register_num];
					memory_data[memory_num] <= memory_data[memory_num];
				end
		endcase
	end

endmodule
