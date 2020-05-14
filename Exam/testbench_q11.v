`timescale 1ns/100ps
`default_nettype none

module FSM (output out_z, input in_x, in_y, clk, reset_b);
reg [1:0] state, next_state;

assign out_z = ((state == 2'b11) || (state == 2'b00));

always @ (posedge clk, negedge reset_b)
  if (reset_b == 1'b0) state <= 2'b00;
  else state <= next_state;

always @ (state, in_x, in_y)
case (state)
  2'b00: if ({in_x, in_y} == 2'b00) next_state = 2'b01;
        else if ({in_x, in_y} == 2'b01) next_state = 2'b10;
        else if ({in_x, in_y} == 2'b10) next_state = 2'b00;
        else next_state = 2'b11;
  2'b01: if ({in_x, in_y} == 2'b00) next_state = 2'b10;
        else if ({in_x, in_y} == 2'b01) next_state = 2'b01;
        else if ({in_x, in_y} == 2'b10) next_state = 2'b00;
        else next_state = 2'b11;
  2'b10: if ({in_x, in_y} == 2'b00) next_state = 2'b10;
        else if ({in_x, in_y} == 2'b01) next_state = 2'b01;
        else if ({in_x, in_y} == 2'b10) next_state = 2'b00;
        else next_state = 2'b10;
  2'b11: if ({in_x, in_y} == 2'b00) next_state = 2'b11;
        else if ({in_x, in_y} == 2'b01) next_state = 2'b00;
        else if ({in_x, in_y} == 2'b10) next_state = 2'b10;
        else next_state = 2'b11;
endcase
endmodule

module test_bench;
  output out_z;
  reg in_x, in_y, clock, reset;

  FSM M0 (out_z, in_x, in_y, clock, reset);

  initial
  	begin
  		$dumpfile("test_bench_q11.vcd");
  		$dumpvars(0, test_bench);
  	end

  initial begin clock = 0; forever #5 clock = ~clock; end
  initial fork
    #0 reset = 0;
    #0 in_x = 0; in_y = 0;
    #2 reset = 1;
    #10 in_x = 0;
    #10 in_y = 0;
    #30 in_x = 0;
    #30 in_y = 0;
    #40 in_x = 0;
    #40 in_y = 0;
    #50 in_x = 0;
    #50 in_y = 0;
  join
  initial #55 $finish;

endmodule
