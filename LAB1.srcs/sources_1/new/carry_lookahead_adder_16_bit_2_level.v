module carry_lookahead_adder_16_bit_2_level 
  (
   input carry_in,
   input [15:0]  i_add1,
   input [15:0]  i_add2,
   output carry_out,
   output [16:0] o_result,
   output Group_P,
   output Group_G
   );
  wire [3:0]    w_G, w_P;
  
  wire c4, c8, c12;
   
  carry_lookahead_adder_4_bit carry_lookahead_adder_4_bit_0
    ( 
      .carry_in(carry_in),
      .i_add1(i_add1[3:0]),
      .i_add2(i_add2[3:0]),
      .carry_out(c4),
      .o_result(o_result[3:0]),
	  .Group_P(w_P[0]),
	  .Group_G(w_G[0])
      );
 
  carry_lookahead_adder_4_bit carry_lookahead_adder_4_bit_1
    ( 
      .carry_in(c4),
      .i_add1(i_add1[7:4]),
      .i_add2(i_add2[7:4]),
      .carry_out(c8),
      .o_result(o_result[7:4]),
	  .Group_P(w_P[1]),
	  .Group_G(w_G[1])
      );
 
  carry_lookahead_adder_4_bit carry_lookahead_adder_4_bit_2
    ( 
      .carry_in(c8),
      .i_add1(i_add1[11:8]),
      .i_add2(i_add2[11:8]),
      .carry_out(c12),
      .o_result(o_result[11:8]),
	  .Group_P(w_P[2]),
	  .Group_G(w_G[2])
      );
   
  carry_lookahead_adder_4_bit carry_lookahead_adder_4_bit_3
    ( 
      .carry_in(c12),
      .i_add1(i_add1[15:12]),
      .i_add2(i_add2[15:12]),
      .carry_out(carry_out),
      .o_result(o_result[15:12]),
	  .Group_P(w_P[3]),
	  .Group_G(w_G[3])
      );
 
  // Create the Carry Terms:

  assign Group_G = w_G[3]|(w_P[3]&w_G[2])|(w_P[3]&w_P[2]&w_G[1])|(w_P[3]&w_P[2]&w_P[1]&w_G[0]);
  assign Group_P = w_P[3]|w_P[2]|w_P[1]|w_P[0];
  assign o_result[16] = carry_out;
 
endmodule 