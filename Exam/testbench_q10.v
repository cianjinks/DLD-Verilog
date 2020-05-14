`timescale 1ns/100ps
`default_nettype none

module Moore_Model (
  output [1: 0] y_out,
  input x_in, clock, reset
);
reg [1: 0] state;
parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
always @ ( posedge clock, negedge reset)
  if (reset == 0) state <= S0; // Initialize to state S0
  else case (state)
    S0: if (x_in) state <= S0; else state <= S1;
    S1: if (x_in) state <= S2; else state <= S0;
    S2: if (x_in) state <= S2; else state <= S3;
    S3: if (x_in) state <= S1; else state <= S3;
  endcase
  assign y_out = state;
endmodule


module test_bench;
  output [1: 0] y_out;
  reg x_in, clock, reset;

  Moore_Model M0 (y_out, x_in, clock, reset);

  initial
  	begin
  		$dumpfile("test_bench_q10.vcd");
  		$dumpvars(0, test_bench);
  	end

  initial begin clock = 0; forever #5 clock = ~clock; end
  initial fork
      #0 reset = 0;
      #0 x_in = 0;
      #2 reset = 1;
      #10 x_in = 0;
      #30 x_in = 1;
      #40 x_in = 0;
      #50 x_in = 0;
  join
  initial #55 $finish;
endmodule
