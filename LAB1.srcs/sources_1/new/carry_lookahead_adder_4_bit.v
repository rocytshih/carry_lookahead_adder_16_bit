module carry_lookahead_adder_4_bit 
  (
   input carry_in,
   input [3:0]  i_add1,
   input [3:0]  i_add2,
   output carry_out,
   output [4:0] o_result,
   output Group_P,
   output Group_G
   );
  wire [2:0]    w_C;
  wire [3:0]    w_G, w_P, w_SUM;
   
  full_adder full_adder_bit_0
    ( 
      .i_bit1(i_add1[0]),
      .i_bit2(i_add2[0]),
      .i_carry(carry_in),
      .o_sum(w_SUM[0]),
      .o_carry(),
	  .P(w_P[0]),
	  .G(w_G[0])
      );
 
  full_adder full_adder_bit_1
    ( 
      .i_bit1(i_add1[1]),
      .i_bit2(i_add2[1]),
      .i_carry(w_C[0]),
      .o_sum(w_SUM[1]),
      .o_carry(),
	  .P(w_P[1]),
	  .G(w_G[1])
      );
 
  full_adder full_adder_bit_2
    ( 
      .i_bit1(i_add1[2]),
      .i_bit2(i_add2[2]),
      .i_carry(w_C[1]),
      .o_sum(w_SUM[2]),
      .o_carry(),
	  .P(w_P[2]),
	  .G(w_G[2])
      );
   
  full_adder full_adder_bit_3
    ( 
      .i_bit1(i_add1[3]),
      .i_bit2(i_add2[3]),
      .i_carry(w_C[2]),
      .o_sum(w_SUM[3]),
      .o_carry(),
	  .P(w_P[3]),
	  .G(w_G[3])
      );
 
  // Create the Carry Terms:
  assign w_C[0] = w_G[0] | (w_P[0] & carry_in);
  assign w_C[1] = w_G[1] | (w_P[1] & w_C[0]);
  assign w_C[2] = w_G[2] | (w_P[2] & w_C[1]);
  assign carry_out = w_G[3] | (w_P[3] & w_C[2]);

  assign Group_G = w_G[3]|(w_P[3]&w_G[2])|(w_P[3]&w_P[2]&w_G[1])|(w_P[3]&w_P[2]&w_P[1]&w_G[0]);
  assign Group_P = w_P[3]|w_P[2]|w_P[1]|w_P[0];
  assign o_result = {carry_out, w_SUM};   // Verilog Concatenation
 
endmodule // carry_lookahead_adder_4_bit