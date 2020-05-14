//This is a moore machine.
//In a state machien diagram the numbers inside the circles have the current state on top and the output on the bottom.
//(He reccomends we build a test bench - requires GTK Wave)
`timescale 1ns/100ps
`default_nettype none

module shift_right (output reg [3: 1] sig_out3to1, output reg sig_out0, input [3: 0] sig_in);
  always @ (sig_in)
    {sig_out3to1, sig_out0} = {sig_in[3], sig_in[3], sig_in[3: 2]};
endmodule


module test_bench;
  output [3: 0] sig_out;
  reg [3: 0] sig_in;

  shift_right M0 (sig_out[3: 1], sig_out[0], sig_in);

  initial
  	begin
  		$dumpfile("test_bench_q8.vcd");
  		$dumpvars(0, test_bench);
  	end
initial #400 $finish;
initial fork
  #0   sig_in = 4'b0000;
  #20  sig_in = 4'b0001;
  #40  sig_in = 4'b0010;
  #60  sig_in = 4'b0011;
  #80  sig_in = 4'b0100;
  #100 sig_in = 4'b0101;
  #120 sig_in = 4'b0110;
  #140 sig_in = 4'b0111;
  #160 sig_in = 4'b1000;
  #180 sig_in = 4'b1001;
  #200 sig_in = 4'b1010;
  #220 sig_in = 4'b1011;
  #240 sig_in = 4'b1100;
  #260 sig_in = 4'b1101;
  #280 sig_in = 4'b1110;
  #300 sig_in = 4'b1111;
join
endmodule
