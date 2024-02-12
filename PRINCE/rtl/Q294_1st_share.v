
//////////////////////////////////////////////////////////////////////////////////
// Company:		   COSIC, KU Leuven
// Engineer:	   Artemii Ovchinnikov
// 
// Create Date:    04:37:12 11/18/2022 
// Design Name:    
// Module Name:    Share_1_Q294 
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

module Share_1_Q294(
	input wire [3:0] data_in_i,
	input wire [3:0] data_in_i_plus_1,
	output wire [3:0] data_out
);

assign data_out[3] = data_in_i[3];
assign data_out[2] = data_in_i[2];
assign data_out[1] = data_in_i[1] ^ (data_in_i[3]&data_in_i[2]) ^ (data_in_i[3]&data_in_i_plus_1[2]) ^ (data_in_i_plus_1[3]&data_in_i[2]);
assign data_out[0] = data_in_i[0] ^ (data_in_i[3]&data_in_i[1]) ^ (data_in_i[3]&data_in_i_plus_1[1]) ^ (data_in_i_plus_1[3]&data_in_i[1]);

endmodule 