//This is a moore machine.
//In a state machien diagram the numbers inside the circles have the current state on top and the output on the bottom.
//(He reccomends we build a test bench - requires GTK Wave)
`timescale 1ns/100ps
`default_nettype none

module Dataflow_2 (input A, B, C, D, output F);
  assign F = (~A&~B&~C&~D) | (~A&~B&C&~D) | (~A&B&~C&D) |
  (~A&B&C&D) | (A&~B&C&D) | (A&B&C&~D);
endmodule


module test_bench;
  wire F;
  reg A, B, C, D;

  Dataflow_2 M0 (A, B, C, D, F);

  initial
  	begin
  		$dumpfile("test_bench.vcd");
  		$dumpvars(0, test_bench);
  	end
initial #400 $finish;
initial fork
  #0 {A, B, C, D} = 4'b0000;
  #20 {A, B, C, D} = 4'b0001;
  #40 {A, B, C, D} = 4'b0010;
  #60 {A, B, C, D} = 4'b0011;

  #80 {A, B, C, D} = 4'b0100;
  #100 {A, B, C, D} = 4'b0101;
  #120 {A, B, C, D} = 4'b0110;
  #140 {A, B, C, D} = 4'b0111;

  #160 {A, B, C, D} = 4'b1000;
  #180 {A, B, C, D} = 4'b1001;
  #200 {A, B, C, D} = 4'b1010;
  #220 {A, B, C, D} = 4'b1011;

  #240 {A, B, C, D} = 4'b1100;
  #260 {A, B, C, D} = 4'b1101;
  #280 {A, B, C, D} = 4'b1110;
  #300 {A, B, C, D} = 4'b1111;
join
endmodule
