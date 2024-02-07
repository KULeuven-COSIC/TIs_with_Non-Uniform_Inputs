
//////////////////////////////////////////////////////////////////////////////////
// Company: 	   COSIC, KU Leuven
// Engineer: 	   Artemii Ovchinnikov
// 
// Create Date:    03:57:32 02/14/2023 
// Design Name: 
// Module Name:    Midori_Sbox 
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
module Midori_Sbox(
	input wire clk,
	input wire [3:0] input1,
	input wire [3:0] input2,
	input wire [3:0] input3,
	output wire [3:0] output1,
	output wire [3:0] output2,
	output wire [3:0] output3
);

	// Interconnections
	wire [3:0] from_A1_1, from_A1_2, from_A1_3;
	wire [3:0] from_Q294_1, from_Q294_2, from_Q294_3;
	wire [11:0] reg_out;
	wire [3:0] half_sh1, half_sh2, half_sh3;
	wire [3:0] from_A2_1, from_A2_2, from_A2_3;
	wire [3:0] from_Q299_1, from_Q299_2, from_Q299_3;
	
	// Affine 1
	A1 A1_all_shares (
		.x1(input1),
		.x2(input2),
		.x3(input3),
		.y1(from_A1_1),
		.y2(from_A1_2),
		.y3(from_A1_3)
   );
	
	// Quadratic 294
	Q294 Q294_all_shares (
		.x1(from_A1_1),
		.x2(from_A1_2),
		.x3(from_A1_3),
		.y1(from_Q294_1),
		.y2(from_Q294_2),
		.y3(from_Q294_3)
   );
	
	Reg_Sbox register (
		.clk(clk),
		.in({from_Q294_1, from_Q294_2, from_Q294_3}),
		.out(reg_out)
	);
	
	assign half_sh1 = reg_out[11:8];
	assign half_sh2 = reg_out[7:4];
	assign half_sh3 = reg_out[3:0];
	
	// Affine2
	A2 A2_all_shares (
		.x1(half_sh1),
		.x2(half_sh2),
		.x3(half_sh3),
		.y1(from_A2_1),
		.y2(from_A2_2),
		.y3(from_A2_3)
   );
	
	// Quadratic Q299
	Q299 Q299_all_shares (
		.x1(from_A2_1),
		.x2(from_A2_2),
		.x3(from_A2_3),
		.y1(from_Q299_1),
		.y2(from_Q299_2),
		.y3(from_Q299_3)
   );
	
	// Affine3
	A3 A3_all_shares (
		.x1(from_Q299_1),
		.x2(from_Q299_2),
		.x3(from_Q299_3),
		.y1(output1),
		.y2(output2),
		.y3(output3)
   );

endmodule
