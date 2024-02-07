
//////////////////////////////////////////////////////////////////////////////////
// Company:		   COSIC, KU Leuven
// Engineer: 	   Artemii Ovchinnikov
// 
// Create Date:    02:21:53 02/17/2023 
// Design Name: 
// Module Name:    nonuniform_rand_midori 
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
module Midori_newrand_r1r2r3r4_column(
	input wire [63:0] group_in0,
	input wire [63:0] group_in1,
	input wire [63:0] group_in2,
	output wire [63:0] group_in_design0,
	output wire [63:0] group_in_design1,
	output wire [63:0] group_in_design2
);

	wire [63:0] restored_pt;
	
	assign restored_pt = group_in0 ^ group_in1 ^ group_in2;
	
	// Share 1: randomness from group_in0
	
	assign group_in_design0[63:60] = group_in0[63:60];
	assign group_in_design0[59:56] = group_in0[63:60];
	assign group_in_design0[55:52] = group_in0[63:60];
	assign group_in_design0[51:48] = group_in0[63:60];
									
	assign group_in_design0[47:44] = group_in0[59:56];
	assign group_in_design0[43:40] = group_in0[59:56];
	assign group_in_design0[39:36] = group_in0[59:56];
	assign group_in_design0[35:32] = group_in0[59:56];
									
	assign group_in_design0[31:28] = group_in0[55:52];
	assign group_in_design0[27:24] = group_in0[55:52];
	assign group_in_design0[23:20] = group_in0[55:52];
	assign group_in_design0[19:16] = group_in0[55:52];
		
	assign group_in_design0[15:12] = group_in0[51:48];
	assign group_in_design0[11:8] = group_in0[51:48];
	assign group_in_design0[7:4] = group_in0[51:48];
	assign group_in_design0[3:0] = group_in0[51:48];
		
	// Share 2: randomness from group_in1
	assign group_in_design1[63:60] = group_in1[63:60];
	assign group_in_design1[59:56] = group_in1[63:60];
	assign group_in_design1[55:52] = group_in1[63:60];
	assign group_in_design1[51:48] = group_in1[63:60];
									
	assign group_in_design1[47:44] = group_in1[59:56];
	assign group_in_design1[43:40] = group_in1[59:56];
	assign group_in_design1[39:36] = group_in1[59:56];
	assign group_in_design1[35:32] = group_in1[59:56];
									
	assign group_in_design1[31:28] = group_in1[55:52];
	assign group_in_design1[27:24] = group_in1[55:52];
	assign group_in_design1[23:20] = group_in1[55:52];
	assign group_in_design1[19:16] = group_in1[55:52];
						
	assign group_in_design1[15:12] = group_in1[51:48];
	assign group_in_design1[11:8] = group_in1[51:48];
	assign group_in_design1[7:4] = group_in1[51:48];
	assign group_in_design1[3:0] = group_in1[51:48];	
	
	// Share 3: pt + rnd1 + rnd2 
	assign group_in_design2[63:60] = restored_pt[63:60] ^ group_in0[63:60] ^ group_in1[63:60];
	assign group_in_design2[59:56] = restored_pt[59:56] ^ group_in0[63:60] ^ group_in1[63:60];
	assign group_in_design2[55:52] = restored_pt[55:52] ^ group_in0[63:60] ^ group_in1[63:60];
	assign group_in_design2[51:48] = restored_pt[51:48] ^ group_in0[63:60] ^ group_in1[63:60];
	
	assign group_in_design2[47:44] = restored_pt[47:44] ^ group_in0[59:56] ^ group_in1[59:56];
	assign group_in_design2[43:40] = restored_pt[43:40] ^ group_in0[59:56] ^ group_in1[59:56];
	assign group_in_design2[39:36] = restored_pt[39:36] ^ group_in0[59:56] ^ group_in1[59:56];
	assign group_in_design2[35:32] = restored_pt[35:32] ^ group_in0[59:56] ^ group_in1[59:56];
	
	assign group_in_design2[31:28] = restored_pt[31:28] ^ group_in0[55:52] ^ group_in1[55:52];
	assign group_in_design2[27:24] = restored_pt[27:24] ^ group_in0[55:52] ^ group_in1[55:52];
	assign group_in_design2[23:20] = restored_pt[23:20] ^ group_in0[55:52] ^ group_in1[55:52];
	assign group_in_design2[19:16] = restored_pt[19:16] ^ group_in0[55:52] ^ group_in1[55:52];
	
	assign group_in_design2[15:12] = restored_pt[15:12] ^ group_in0[51:48] ^ group_in1[51:48];
	assign group_in_design2[11:8] = restored_pt[11:8] ^ group_in0[51:48] ^ group_in1[51:48];
	assign group_in_design2[7:4] = restored_pt[7:4] ^ group_in0[51:48] ^ group_in1[51:48];
	assign group_in_design2[3:0] = restored_pt[3:0] ^ group_in0[51:48] ^ group_in1[51:48];
	
endmodule
