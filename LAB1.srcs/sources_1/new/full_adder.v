`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/22 21:20:09
// Design Name: 
// Module Name: ALU_Logic_Unit
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


module full_adder(
		input i_bit1,
		input i_bit2,
		input i_carry,
		output o_sum,
		output o_carry,
		output P,
		output G
    );
	
assign o_sum = (i_bit1^i_bit2)^i_carry;
assign o_carry = ((i_bit1^i_bit2)&i_carry)|(i_bit1&i_bit2);
assign P = i_bit1 | i_bit2;
assign G = i_bit1 & i_bit2;
	
endmodule
	
