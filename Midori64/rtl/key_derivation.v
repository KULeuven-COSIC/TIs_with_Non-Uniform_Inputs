
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
// 
// Create Date:    07:47:22 01/19/2023 
// Design Name: 
// Module Name:    key_derivation 
// Project Name: 
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
module key_derivation(
	input wire [127:0] master_key,
	output wire [63:0] WK,
	output wire [63:0] MK0,
	output wire [63:0] MK1
);

	assign MK0 = master_key[127:64];
	assign MK1 = master_key[63:0];
	assign WK = master_key[127:64] ^ master_key[63:0];

endmodule
