module AdderSub(sum_diff, carry, A, B, select);
  output [3: 0] sum_diff;
  output carry;
  input [3: 0] A, B;
  input select;

  assign {carry, sum_diff} = select ? A - B : A + B;

endmodule
