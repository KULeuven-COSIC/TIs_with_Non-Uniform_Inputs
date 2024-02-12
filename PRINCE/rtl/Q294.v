
//////////////////////////////////////////////////////////////////////////////////
// Company:		   COSIC, KU Leuven
// Engineer:	   Artemii Ovchinnikov
// 
// Create Date:    04:37:12 11/18/2022 
// Design Name:    
// Module Name:    Quadratic_294 
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

module Quadratic_294(
	input wire [3:0] x1,	// one 4-bit input share per A-box
	input wire [3:0] x2,
	input wire [3:0] x3,
	output wire [3:0] y1,	// one 4-bit output share per A-box
	output wire [3:0] y2,
	output wire [3:0] y3
);

Share_1_Q294 i_share_1_Q294 (x1, x2, y1);
Share_1_Q294 i_share_2_Q294 (x2, x3, y2);
Share_1_Q294 i_share_3_Q294 (x3, x1, y3);

endmodule 