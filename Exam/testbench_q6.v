//This is a moore machine.
//In a state machien diagram the numbers inside the circles have the current state on top and the output on the bottom.
//(He reccomends we build a test bench - requires GTK Wave)
`timescale 1ns/100ps
`default_nettype none

module Incrementer (output [3: 0] sum, output carry, input [3: 0] A);
  assign {carry, sum} = A + 1;
endmodule


module test_bench;
  wire F;
  output [3: 0] useless_sum;
  reg [3: 0] A;

  Incrementer M0 (useless_sum, F, A);

  initial
  	begin
  		$dumpfile("test_bench_q6.vcd");
  		$dumpvars(0, test_bench);
  	end
initial #400 $finish;
initial fork
  #0 A = 4'b0000;
  #20 A = 4'b0001;
  #40 A = 4'b0010;
  #60 A = 4'b0011;

  #80 A = 4'b0100;
  #100 A = 4'b0101;
  #120 A = 4'b0110;
  #140 A = 4'b0111;

  #160 A = 4'b1000;
  #180 A = 4'b1001;
  #200 A = 4'b1010;
  #220 A = 4'b1011;
  
  #240 A = 4'b1100;
  #260 A = 4'b1101;
  #280 A = 4'b1110;
  #300 A = 4'b1111;
join
endmodule
