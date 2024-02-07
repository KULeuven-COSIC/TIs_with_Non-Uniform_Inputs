
//////////////////////////////////////////////////////////////////////////////////
// Company: 	   COSIC, KU Leuven
// Engineer: 	   Artemii Ovchinnikov
// 
// Create Date:    05:52:14 11/22/2022 
// Design Name: 
// Module Name:    Q299_box 
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
module Q299_box(
	input wire [3:0] in_1,
	input wire [3:0] in_2,
	output wire [3:0] out
);

	assign out[3] = in_1[3];
	
	assign out[2] = in_1[2] ^ (in_1[1]&in_1[3] ^ in_1[3]&in_2[1] ^ in_1[1]&in_2[3]) 
			^ (in_1[2]&in_1[3] ^ in_1[3]&in_2[2] ^ in_1[2]&in_2[3]);
			
	assign out[1] = in_1[1] ^ (in_1[0]&in_1[3] ^ in_1[3]&in_2[0] ^ in_1[0]&in_2[3])
			^ (in_1[1]&in_1[3] ^ in_1[3]&in_2[1] ^ in_1[1]&in_2[3]) ^ (in_1[2]&in_1[3] ^ in_1[3]&in_2[2] ^ in_1[2]&in_2[3]);
	
	assign out[0] = in_1[0] ^ (in_1[0]&in_1[3] ^ in_1[3]&in_2[0] ^ in_1[0]&in_2[3])
			^ (in_1[2]&in_1[3] ^ in_1[3]&in_2[2] ^ in_1[2]&in_2[3]);

endmodule
