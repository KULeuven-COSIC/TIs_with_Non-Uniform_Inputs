
//////////////////////////////////////////////////////////////////////////////////
// Company: 	   COSIC, KU Leuven
// Engineer: 	   Artemii Ovchinnikov
// 
// Create Date:    03:19:53 02/14/2023 
// Design Name: 
// Module Name:    round_key 
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
module round_key(
	input wire [63:0] k0,
	input wire [63:0] k1,
	input wire sel,
	input wire [15:0] constant,
	output wire [63:0] roundkey
);

	wire [63:0] selected_key;
	
	// select the key
	assign selected_key = sel ? k1: k0;
	
	assign roundkey[63:61] = selected_key[63:61];
	assign roundkey[59:57] = selected_key[59:57];
	assign roundkey[55:53] = selected_key[55:53];
	assign roundkey[51:49] = selected_key[51:49];
	assign roundkey[47:45] = selected_key[47:45];
	assign roundkey[43:41] = selected_key[43:41];
	assign roundkey[39:37] = selected_key[39:37];
	assign roundkey[35:33] = selected_key[35:33];
	assign roundkey[31:29] = selected_key[31:29];
	assign roundkey[27:25] = selected_key[27:25];
	assign roundkey[23:21] = selected_key[23:21];
	assign roundkey[19:17] = selected_key[19:17];
	assign roundkey[15:13] = selected_key[15:13];
	assign roundkey[11:9]  = selected_key[11:9] ;
	assign roundkey[7:5]   = selected_key[7:5]  ;
	assign roundkey[3:1]   = selected_key[3:1]  ;
	
	// add round constant
	assign roundkey[60] = selected_key[60] ^ constant[15];
	assign roundkey[56] = selected_key[56] ^ constant[14];
	assign roundkey[52] = selected_key[52] ^ constant[13];
	assign roundkey[48] = selected_key[48] ^ constant[12];
	assign roundkey[44] = selected_key[44] ^ constant[11];
	assign roundkey[40] = selected_key[40] ^ constant[10];
	assign roundkey[36] = selected_key[36] ^ constant[9];
	assign roundkey[32] = selected_key[32] ^ constant[8];
	assign roundkey[28] = selected_key[28] ^ constant[7];
	assign roundkey[24] = selected_key[24] ^ constant[6];
	assign roundkey[20] = selected_key[20] ^ constant[5];
	assign roundkey[16] = selected_key[16] ^ constant[4];
	assign roundkey[12] = selected_key[12] ^ constant[3];
	assign roundkey[8] = selected_key[8] ^ constant[2];
	assign roundkey[4] = selected_key[4] ^ constant[1];
	assign roundkey[0] = selected_key[0] ^ constant[0];

endmodule
