module Binary_Adder(BSum, C_out, B, A, C_in);
  output [3: 0] BSum;
  output C_out;
  input [3: 0] A, B;
  input C_in;

  assign {C_out, BSum} = A + B + C_in;
endmodule

module BCD_Adder (Sum, Carry_out, Addend, Augend, Carry_in);
  output [3: 0] Sum;
  output Carry_out;
  input [3: 0] Augend, Addend;
  input Carry_in;

  wire [3: 0] Sum_wire, Addend2;
  wire Carry_out_wire;

  wire and1, and2, C, D;

  and (and1, Sum_wire[2], Sum_wire[3]);
  and (and2, Sum_wire[1], Sum_wire[3]);
  or  (Carry_out, and1, and2, Carry_out_wire);

  assign Addend2 [0] = 0;
  assign Addend2 [1] = Carry_out;
  assign Addend2 [2] = Carry_out;
  assign Addend2 [3] = 0;

  assign C = 0;
  assign D = 0;

  Binary_Adder badder1(.BSum(Sum_wire), .C_out(Carry_out_wire), .B(Addend), .A(Augend), .C_in(Carry_in));
  Binary_Adder badder2(.BSum(Sum), .C_out(C), .B(Addend2), .A(Sum_wire), .C_in(D));
endmodule
