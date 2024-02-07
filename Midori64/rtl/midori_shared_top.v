
//////////////////////////////////////////////////////////////////////////////////
// Company:		   COSIC, KU Leuven
// Engineer: 	   Artemii Ovchinnikov
// 
// Create Date:    04:37:12 11/18/2022 
// Design Name:    Midori64 (td+1)-shares, 1st order secure implementation
// Module Name:    midori_shared_top 
// Project Name:   TI with Non-Uniform Inputs
// Target Devices: 
// Tool versions: 
// Description:    https://eprint.iacr.org/2023/1517
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module midori_shared_top(
	input wire clk,
	input wire reset,
	input wire start,
	input wire [63:0] plaintext_1,
	input wire [63:0] plaintext_2,
	input wire [63:0] plaintext_3,
	input wire [127:0] key,
	output wire done,
	output wire [63:0] ciphertext_1,
	output wire [63:0] ciphertext_2,
	output wire [63:0] ciphertext_3
);

	// interconnections
	wire [63:0] round_key;
	wire [63:0] MK0, MK1;
	wire [3:0] round;
	wire [63:0] state_sh1, state_sh2, state_sh3;
	wire [63:0] state_in1, state_in2, state_in3;
	
	// Midori specific
	wire select_start;
	wire [63:0] whitening_key;
	wire [63:0] whitened_plaintext_1;
	wire [63:0] unwhitened_ciphertext_1;
	
	// Key generation block
	key_derivation keys (
		.master_key(key),
		.WK(whitening_key),
		.MK0(MK0),
		.MK1(MK1)
	);
	
	// control logic
	midori_control midori_control (
		.clk(clk),
		.rst(reset),
		.start(start),
		.round(round),
		.start_sel(select_start),
		.done(done)
	);
	
	// XOR Whitening key with one share (key is unshared)
	XOR_64 add_WK_start (
		.in_1(plaintext_1),
		.in_2(whitening_key),
		.out(whitened_plaintext_1)
	);
	
	// main design block
	midori_shared_main main_part (
		.clk(clk),
		.round(round),
		.start_sel(select_start),
		.state_1st(whitened_plaintext_1),
		.state_2nd(plaintext_2),
		.state_3rd(plaintext_3),
		.MK0(MK0),
		.MK1(MK1),
		.ciphertext_1(unwhitened_ciphertext_1),
		.ciphertext_2(ciphertext_2),
		.ciphertext_3(ciphertext_3)
	);
	
	// XOR Whitening key at the end
	XOR_64 add_WK_end (
		.in_1(unwhitened_ciphertext_1),
		.in_2(whitening_key),
		.out(ciphertext_1)
	);

endmodule
