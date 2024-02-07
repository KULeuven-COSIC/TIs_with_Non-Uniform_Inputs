
//////////////////////////////////////////////////////////////////////////////////
// Company: 	   COSIC, KU Leuven
// Engineer: 	   Artemii Ovchinnikov
// 
// Create Date:    05:46:18 11/22/2022 
// Design Name: 
// Project Name:   TI with Non-Uniform Inputs
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
module Q294_box(
	input wire [3:0] in_1,
	input wire [3:0] in_2,
	output wire [3:0] out
);

	assign out[3] = in_1[3];
	assign out[2] = in_1[2];
	assign out[1] = in_1[1] ^ (in_1[3]&in_1[2]) ^ (in_1[3]&in_2[2]) ^ (in_2[3]&in_1[2]);
	assign out[0] = in_1[0] ^ (in_1[3]&in_1[1]) ^ (in_1[3]&in_2[1]) ^ (in_2[3]&in_1[1]);

endmodule
