
//////////////////////////////////////////////////////////////////////////////////
// Company: 	   COSIC, KU Leuven
// Engineer: 	   Artemii Ovchinnikov
// 
// Create Date:    03:44:03 02/14/2023 
// Design Name: 
// Module Name:    midori_nonlinear 
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
module midori_nonlinear(
	input wire clk,
	input wire [63:0] state_1,
	input wire [63:0] state_2,
	input wire [63:0] state_3,
	output wire [63:0] state_out_1,
	output wire [63:0] state_out_2,
	output wire [63:0] state_out_3
);

	genvar j;
	
	// generate 16 Sboxes separately
	generate 
		for (j = 0 ; j <= 15 ; j = j + 1) begin: Sbox
			Midori_Sbox Sbox_i (
				.clk(clk),
				.input1(state_1[63 - 4*j : 63 - 4*j - 3]),
				.input2(state_2[63 - 4*j : 63 - 4*j - 3]),
				.input3(state_3[63 - 4*j : 63 - 4*j - 3]),
				.output1(state_out_1[63 - 4*j : 63 - 4*j - 3]),
				.output2(state_out_2[63 - 4*j : 63 - 4*j - 3]),
				.output3(state_out_3[63 - 4*j : 63 - 4*j - 3])
			);
		end
	endgenerate

endmodule
