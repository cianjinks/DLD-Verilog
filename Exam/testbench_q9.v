//This is a moore machine.
//In a state machien diagram the numbers inside the circles have the current state on top and the output on the bottom.
//(He reccomends we build a test bench - requires GTK Wave)
`timescale 1ns/100ps
`default_nettype none

module ALU (output reg [7: 0] y, input [7: 0] A, B, input [2: 0] Sel);
  always @ (A, B, Sel) begin
    y = 0;
    case (Sel)
      3'b000:y = 8'b0;
      3'b001:y = A & B;
      3'b010:y = A | B;
      3'b011:y = A ^ B;
      3'b100:y = A + B;
      3'b101:y = A - B;
      3'b110:y = ~A;
      3'b111:y = 8'hFF;
    endcase
  end
endmodule


module test_bench;
  output [7: 0] y;
  reg [7: 0] A, B;
  reg [2: 0] Sel;

  ALU M0 (y, A, B, Sel);

  initial
  	begin
  		$dumpfile("test_bench_q9.vcd");
  		$dumpvars(0, test_bench);
  	end
initial #400 $finish;
initial fork
  #0 A = 8'b00000000;
  #0 B = 8'b00110001;
  #0 Sel = 3'b001;

join
endmodule
