`timescale 1ns/100ps
`default_nettype none

module Serial_Twos_Comp (output y, input [7: 0] data, input load, shift_control, Clock, reset_b);
  reg tempy;
  reg [7: 0] tempdata;
  reg [7: 0] complementedata;

  always @ (posedge Clock, negedge reset_b)
    begin
    if (reset_b == 0)
      begin
        tempdata = 8'b00000000;
        tempy = 1'b0;
      end

    if (load == 0)
      begin
      if (shift_control == 1)
        begin

        tempy = complementedata[0];
        complementedata = complementedata >> 1;

        end
      end
    else
      begin
      tempdata = data;
      complementedata = (tempdata ^ 8'b11111111) + 1'b1;
      end
    end

  assign y = tempy;

endmodule
