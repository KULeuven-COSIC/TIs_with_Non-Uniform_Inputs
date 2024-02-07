
//////////////////////////////////////////////////////////////////////////////////
// Company: 	   COSIC, KU Leuven
// Engineer: 	   Artemii Ovchinnikov
// 
// Create Date:    05:18:34 11/21/2022 
// Design Name: 
// Module Name:    midori_shuffle 
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
module midori_shuffle(
	input wire [63:0] in,
	output wire [63:0] out
);

	// make the following state shuffle
	// S0,...,S15 -> S0, S10, S5, S15, S14, S4, S11, S1, S9, S3, S12, S6, S7, S13, S2, S8

	assign out[63:60] = in[63:60];
	assign out[59:56] = in[23:20];
	assign out[55:52] = in[43:40];
	assign out[51:48] = in[3:0];
	assign out[47:44] = in[7:4];
	assign out[43:40] = in[47:44];
	assign out[39:36] = in[19:16];
	assign out[35:32] = in[59:56];
	assign out[31:28] = in[27:24];
	assign out[27:24] = in[51:48];
	assign out[23:20] = in[15:12];
	assign out[19:16] = in[39:36];
	assign out[15:12] = in[35:32];
	assign out[11:8] = in[11:8];
	assign out[7:4] = in[55:52];
	assign out[3:0] = in[31:28];

endmodule
