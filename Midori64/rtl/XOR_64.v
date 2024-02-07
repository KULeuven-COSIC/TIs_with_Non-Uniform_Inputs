
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: 	   
// 
// Create Date:    03:52:22 11/21/2022 
// Design Name: 
// Module Name:    XOR_64 
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
module XOR_64(
	input wire [63:0] in_1,
	input wire [63:0] in_2,
	output wire [63:0] out
);

	assign out = in_1 ^ in_2;

endmodule
