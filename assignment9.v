//This is a moore machine.
//In a state machien diagram the numbers inside the circles have the current state on top and the output on the bottom.
//(He reccomends we build a test bench - requires GTK Wave)

`timescale 1ns/100ps
`default_nettype none

module StateDiagram(output y_out, input x_in, clk, reset_b);
  reg [1: 0] state, next_state;
  reg output_state;
  parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101;

  // Change state on the rising edge of the clock or rest on negative edge
  always @ (posedge clk, negedge reset_b)
    begin
      if (reset_b == 0)
        state <= S0;
      else
        state <= next_state;
    end

  always @ (state)
    begin
      case (state)
        S0:
          output_state <= 1'b0;
        S1:
          output_state <= 1'b1;
        S2:
          output_state <= 1'b1;
        S3:
          output_state <= 1'b1;
        S4:
          output_state <= 1'b0;
        S5:
          output_state <= 1'b0;
      endcase
    end


  assign y_out = output_state;

  always @ (negedge clk)
    begin
      case (state)
        S0:
          if(x_in == 1'b0)
            next_state = S0;
          else
            next_state = S1;
        S1:
          next_state = S2;
        S2:
          next_state = S3;
        S3:
          next_state = S4;
        S4:
          next_state = S5;
        S5:
          next_state = S0;
      endcase
    end
endmodule
