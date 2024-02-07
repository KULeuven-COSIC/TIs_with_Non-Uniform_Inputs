
//////////////////////////////////////////////////////////////////////////////////
// Company: 	   COSIC, KU Leuven
// Engineer: 	   Artemii Ovchinnikov
// 
// Create Date:    04:40:49 11/21/2022 
// Design Name: 
// Module Name:    midori_shared_main 
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
module midori_shared_main(
	input wire clk,
	input wire [3:0] round,
	input wire start_sel,	
	input wire [63:0] state_1st,
	input wire [63:0] state_2nd,
	input wire [63:0] state_3rd,
	input wire [63:0] MK0,
	input wire [63:0] MK1,
	output wire [63:0] ciphertext_1,
	output wire [63:0] ciphertext_2,
	output wire [63:0] ciphertext_3
);

	// interconnections used
	wire [63:0] nonlinear_out_1, nonlinear_out_2, nonlinear_out_3;
	wire [63:0] shuffle_out_1, shuffle_out_2, shuffle_out_3;
	wire [63:0] MC_out_1;
	wire [63:0] round_out_1, round_out_2, round_out_3;
	wire [63:0] state_out_1st, state_out_2nd, state_out_3rd;
	wire [63:0] reg1_out1, reg1_out2, reg1_out3;
	wire [15:0] round_cnst;
	wire [63:0] roundkey;
		
	
	MUX_RC select_round_constant(
		.round(round),
		.round_cnst(round_cnst)
	);
	
	// Choose key to XOR with the round constant
	round_key sel_xor_key_constant (
		.k0(MK0),
		.k1(MK1),
		.sel(round[0]),
		.constant(round_cnst),
		.roundkey(roundkey)
	);
	
	// 3 registers (one per share) with selector to chose the initial input or the output of a round	
	select_register_64 first_register_1 (
		.clk(clk),
		.sel(start_sel),
		.state_in_1(state_1st),
		.state_in_2(round_out_1),
		.state_out(reg1_out1)
	);
	
	select_register_64 first_register_2 (
		.clk(clk),
		.sel(start_sel),
		.state_in_1(state_2nd),
		.state_in_2(round_out_2),
		.state_out(reg1_out2)
	);
	
	select_register_64 first_register_3 (
		.clk(clk),
		.sel(start_sel),
		.state_in_1(state_3rd),
		.state_in_2(round_out_3),
		.state_out(reg1_out3)
	);
	
	// implement nonlinear (decomposed S-box) layer of Midori64
	midori_nonlinear midori_nonlinear_layer (
		.clk(clk),
		.state_1(reg1_out1),
		.state_2(reg1_out2),
		.state_3(reg1_out3),
		.state_out_1(nonlinear_out_1),
		.state_out_2(nonlinear_out_2),
		.state_out_3(nonlinear_out_3)
	);
	
	// Calculate the ciphertext for the output after 15th round
	assign ciphertext_1 = nonlinear_out_1;
	assign ciphertext_2 = nonlinear_out_2;
	assign ciphertext_3 = nonlinear_out_3;
	
	// Shuffle stage
	midori_shuffle shuffle_1 (
		.in(nonlinear_out_1),
		.out(shuffle_out_1)
	);
	
	midori_shuffle shuffle_2 (
		.in(nonlinear_out_2),
		.out(shuffle_out_2)
	);
	
	midori_shuffle shuffle_3 (
		.in(nonlinear_out_3),
		.out(shuffle_out_3)
	);
	
	// MixColumns layer
	midori_MC Mix1 (
		.in(shuffle_out_1),
		.out(MC_out_1)
	);
	
	midori_MC Mix2 (
		.in(shuffle_out_2),
		.out(state_out_2nd)
	);
	
	midori_MC Mix3 (
		.in(shuffle_out_3),
		.out(state_out_3rd)
	);
	
	// XOR the state_1 with the key (not shared)
	XOR_64 add_round_key (
		.in_1(MC_out_1),
		.in_2(roundkey),
		.out(state_out_1st)
	);
	
	// assign wires to connect with the first select-register
	assign round_out_1 = state_out_1st;
	assign round_out_2 = state_out_2nd;
	assign round_out_3 = state_out_3rd;

endmodule
