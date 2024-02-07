
//////////////////////////////////////////////////////////////////////////////////
// Company: 	   COSIC, KU Leuven
// Engineer: 	   Artemii Ovchinnikov
// 
// Create Date:    06:07:12 11/22/2022 
// Design Name: 
// Module Name:    A2_box 
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
module A2_box(
	input wire [3:0] in,
	output wire [3:0] out
);

	assign out[3] = in[0];
	assign out[2] = in[3];
	assign out[1] = in[2];
	assign out[0] = in[1];

endmodule
