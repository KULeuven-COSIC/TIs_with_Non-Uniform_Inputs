
//////////////////////////////////////////////////////////////////////////////////
// Company: 	   COSIC, KU Leuven	
// Engineer: 	   Artemii Ovchinnikov
// 
// Create Date:    03:07:57 02/14/2023 
// Design Name: 
// Module Name:    MUX_RC 
// Project Name:   TI with Non-Uniform Inputs
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module MUX_RC(
	input wire [3:0] round,
	output reg [15:0] round_cnst
);

	always @(*) begin
		case (round)
			5'd0:
				round_cnst <= 16'b0001010110110011;
			5'd1:
				round_cnst <= 16'b0111100011000000;
			5'd2:
				round_cnst <= 16'b1010010000110101;
			5'd3:
				round_cnst <= 16'b0110001000010011;
			5'd4:
				round_cnst <= 16'b0001000001001111;
			5'd5:
				round_cnst <= 16'b1101000101110000;
			5'd6:
				round_cnst <= 16'b0000001001100110;
			5'd7:
				round_cnst <= 16'b0000101111001100;
			5'd8:
				round_cnst <= 16'b1001010010000001;
			5'd9:
				round_cnst <= 16'b0100000010111000;
			5'd10:
				round_cnst <= 16'b0111000110010111;
			5'd11:
				round_cnst <= 16'b0010001010001110;
			5'd12:
				round_cnst <= 16'b0101000100110000;
			5'd13:
				round_cnst <= 16'b1111100011001010;
			default: //5'd14: // or Round 15
				round_cnst <= 16'b1101111110010000;
		endcase
	end

endmodule
