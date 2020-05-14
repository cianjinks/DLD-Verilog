//This is a moore machine.
//In a state machien diagram the numbers inside the circles have the current state on top and the output on the bottom.
//(He reccomends we build a test bench - requires GTK Wave)
`timescale 1ns/100ps
`default_nettype none

module mag_compare ( input [1: 0] A, B, output A_gt_B );
  assign A_gt_B = (A > B);
endmodule


module test_bench;
  wire F;
  reg [1: 0] A, B;

  mag_compare M0 (A, B, F);

  initial
  	begin
  		$dumpfile("test_bench_q5.vcd");
  		$dumpvars(0, test_bench);
  	end
initial #400 $finish;
initial fork
  #0 {A, B} = 4'b0000;
  #20 {A, B} = 4'b0001;
  #40 {A, B} = 4'b0010;
  #60 {A, B} = 4'b0011;

  #80 {A, B} = 4'b0100;
  #100 {A, B} = 4'b0101;
  #120 {A, B} = 4'b0110;
  #140 {A, B} = 4'b0111;

  #160 {A, B} = 4'b1000;
  #180 {A, B} = 4'b1001;
  #200 {A, B} = 4'b1010;
  #220 {A, B} = 4'b1011;

  #240 {A, B} = 4'b1100;
  #260 {A, B} = 4'b1101;
  #280 {A, B} = 4'b1110;
  #300 {A, B} = 4'b1111;
join
endmodule
