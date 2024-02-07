
//////////////////////////////////////////////////////////////////////////////////
// Company:		   COSIC, KU Leuven
// Engineer: 	   Artemii Ovchinnikov
// 
// Create Date:    02:11:38 02/17/2023 
// Design Name: 
// Module Name:    midori_initrand_wrap 
// Project Name:   TI with Non-Uniform Inputs
// Target Devices: 
// Tool versions: 
// Description:    Submodule used to simulate Non-Uniform inputs
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module midori_initrand_wrap(
	input wire clk,
	input wire reset,
	input wire start,
	input wire [63:0] plaintext_rand_1,
	input wire [63:0] plaintext_rand_2,
	input wire [63:0] plaintext_rand_3,
	input wire [127:0] key,
	output wire done,
	output wire [63:0] ciphertext_1,
	output wire [63:0] ciphertext_2,
	output wire [63:0] ciphertext_3
);

	wire [63:0] plain_to_cipher_1, plain_to_cipher_2, plain_to_cipher_3;
	wire [63:0] init_pt_1, init_pt_2, init_pt_3;
	
	// module to re-form initial rondomness (change called submodule to change the type of non-uniformity used)
	Midori_newrand_r1r2r3r4_column midori_init_rand (
		.group_in0(plaintext_rand_1),
		.group_in1(plaintext_rand_2),
		.group_in2(plaintext_rand_3), 
		.group_in_design0(plain_to_cipher_1),
		.group_in_design1(plain_to_cipher_2),
		.group_in_design2(plain_to_cipher_3)
	);
	
	reg64_init_pt midori_inp_reg_1(
		.clk(clk),
		.in(plain_to_cipher_1),
		.out(init_pt_1)
	); 
	reg64_init_pt midori_inp_reg_2 (
		.clk(clk),
		.in(plain_to_cipher_2),
		.out(init_pt_2)
	); 
	reg64_init_pt midori_inp_reg_3 (
		.clk(clk),
		.in(plain_to_cipher_3),
		.out(init_pt_3)
	); 
	
	midori_shared_top uut (
		.clk (clk),
		.reset (reset),
		.start (start),
		.plaintext_1 (init_pt_1),
		.plaintext_2 (init_pt_2),
		.plaintext_3 (init_pt_3),
		.key (key),
		.done (done),
		.ciphertext_1(ciphertext_1),
		.ciphertext_2(ciphertext_2),
		.ciphertext_3(ciphertext_3)
	);

endmodule
