`timescale 1ns/100ps
`default_nettype none

module Serial_Twos_Comp (output y, input [7: 0] data, input load, shift_control, Clock, reset_b);
	reg [7:0] shiftregister;
	reg carry;
	wire result;
	wire next_carry;

	assign {next_carry, result} = (shiftregister[0] ^ 1'b1) + carry;

	always @(posedge Clock, negedge reset_b) begin
		if(reset_b == 0) begin
			carry <= 1;
			shiftregister <= 0;
		end
		else if(load == 1) begin

			shiftregister <= data;
		end
		else if(shift_control == 1)begin
			carry <= next_carry;
			shiftregister <= {result, shiftregister[7:1]};
		end

	end
	assign y = result;

endmodule
