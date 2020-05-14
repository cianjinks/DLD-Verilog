// Attempt 2
module OddFunction(output A, input x, y, clk, reset_b);
  reg state, next_state;
  parameter S0 = 1'b0, S1 = 1'b1;

  // Change state on the rising edge of the clock or rest on negative edge
  always @ (posedge clk, negedge reset_b)
    begin
      if (reset_b == 0)
        state <= S0;
      else
        state <= next_state;
    end

  assign A = 1'b0;

  always @ (negedge clk)
    begin
      case (state)
        S0:
          if(x == 1'b0 && y == 1'b0)
            next_state = 1'b0;
          else if(x == 1'b0 && y == 1'b1)
            next_state = 1'b1;
          else if(x == 1'b1 && y == 1'b0)
            next_state = 1'b1;
          else
            next_state = 1'b0;
        S1:
          if(x == 1'b0 && y == 1'b0)
            next_state = 1'b1;
          else if(x == 1'b0 && y == 1'b1)
            next_state = 1'b0;
          else if(x == 1'b1 && y == 1'b0)
            next_state = 1'b0;
          else
            next_state = 1'b1;
        endcase
    end
endmodule
