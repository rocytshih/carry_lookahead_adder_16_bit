module carry_lookahead_adder_16_bit_2_level_tb;
 
reg	carry_in = 0; 
reg [15:0] r_ADD_1 = 0;
reg [15:0] r_ADD_2 = 0;
wire carry_out;
wire [16:0] o_result;
wire Group_P;
wire Group_G;
   
carry_lookahead_adder_16_bit_2_level carry_lookahead_adder_16_bit_2_level
(
 .carry_in(carry_in),
 .i_add1(r_ADD_1),
 .i_add2(r_ADD_2),
 .carry_out(carry_out),
 .o_result(o_result),
 .Group_P(Group_P),
 .Group_G(Group_G)
 );

initial
begin
  carry_in = 0;
  #10;
  r_ADD_1 = 16'h0001;
  r_ADD_2 = 16'h0001;
  #10;
  r_ADD_1 = 16'h0018;
  r_ADD_2 = 16'h0320;
  #10;
  r_ADD_1 = 16'h0018;
  r_ADD_2 = 16'h0020;
  #10;
  r_ADD_1 = 16'h8018;
  r_ADD_2 = 16'h8020;
end
 
endmodule // carry_lookahead_adder_tb


/*
module carry_lookahead_adder_tb;
 
reg	carry_in = 0; 
reg [3:0] r_ADD_1 = 0;
reg [3:0] r_ADD_2 = 0;
wire carry_out;
wire [4:0] o_result;
wire Group_P;
wire Group_G;
   
carry_lookahead_adder_4_bit carry_lookahead_adder
(
 .carry_in(carry_in),
 .i_add1(r_ADD_1),
 .i_add2(r_ADD_2),
 .carry_out(carry_out),
 .o_result(o_result),
 .Group_P(Group_P),
 .Group_G(Group_G)
 );

initial
begin
  carry_in = 0;
  #10;
  r_ADD_1 = 4'b0000;
  r_ADD_2 = 4'b0001;
  #10;
  r_ADD_1 = 4'b0010;
  r_ADD_2 = 4'b0010;
  #10;
  r_ADD_1 = 4'b0101;
  r_ADD_2 = 4'b0110;
  #10;
  r_ADD_1 = 4'b1111;
  r_ADD_2 = 4'b0111;
  #10;
end
 
endmodule // carry_lookahead_adder_tb
*/