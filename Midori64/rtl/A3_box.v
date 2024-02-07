
//////////////////////////////////////////////////////////////////////////////////
// Company: 	   COSIC, KU Leuven
// Engineer: 	   Artemii Ovchinnikov
// 
// Create Date:    06:13:31 11/22/2022 
// Design Name: 
// Module Name:    A3_box 
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
module A3_box(
	input wire [3:0] in,
	output wire [3:0] out
);

	assign out[3] = in[3] ^ in[2] ^ in[1] ^ 1'b1;
	assign out[2] = in[3] ^ in[2] ^ in[0] ^ 1'b1;
	assign out[1] = in[3] ^ in[2] ^ in[1] ^ in[0] ^ 1'b1;
	assign out[0] = in[2] ^ in[0];

endmodule
