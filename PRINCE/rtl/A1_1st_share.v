
//////////////////////////////////////////////////////////////////////////////////
// Company:		   COSIC, KU Leuven
// Engineer:	   Artemii Ovchinnikov
// 
// Create Date:    11/18/2022 
// Design Name:    
// Module Name:    Share_1_A1 
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

module Share_1_A1(
	input wire [3:0] data_in,
	output wire [3:0] data_out
);

assign data_out[3] = 1'b1 ^ data_in[3] ^ data_in[1];
assign data_out[2] = 1'b1 ^ data_in[2];
assign data_out[1] = data_in[1] ^ data_in[0];
assign data_out[0] = data_in[1];

endmodule 