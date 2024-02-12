
//////////////////////////////////////////////////////////////////////////////////
// Company:		   COSIC, KU Leuven
// Engineer:	   Artemii Ovchinnikov
// 
// Create Date:    04:37:12 11/18/2022 
// Design Name:    
// Module Name:    linear_m_inv 
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

module linear_m_inv (
  input [63:0] data_in,
  output wire [63:0] data_out
);

// 1 share
assign data_out[63:60] = data_in[63:60];
assign data_out[59:56] = data_in[11:8];
assign data_out[55:52] = data_in[23:20];
assign data_out[51:48] = data_in[35:32];
assign data_out[47:44] = data_in[47:44];
assign data_out[43:40] = data_in[59:56];
assign data_out[39:36] = data_in[7:4];
assign data_out[35:32] = data_in[19:16];
assign data_out[31:28] = data_in[31:28];
assign data_out[27:24] = data_in[43:40];
assign data_out[23:20] = data_in[55:52];
assign data_out[19:16] = data_in[3:0];
assign data_out[15:12] = data_in[15:12];
assign data_out[11:8] = data_in[27:24];
assign data_out[7:4] = data_in[39:36];
assign data_out[3:0] = data_in[51:48];

endmodule
