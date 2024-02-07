
//////////////////////////////////////////////////////////////////////////////////
// Company: 	   COSIC, KU Leuven
// Engineer: 	   Artemii Ovchinnikov
// 
// Create Date:    05:45:32 11/22/2022 
// Design Name: 
// Module Name:    Q294 
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
module Q294(
	input wire [3:0] x1,
	input wire [3:0] x2,
	input wire [3:0] x3,
	output wire [3:0] y1,
	output wire [3:0] y2,
	output wire [3:0] y3
);

	Q294_box Share_1(.in_1(x2), .in_2(x3), .out(y1));	
	Q294_box Share_2(.in_1(x3), .in_2(x1), .out(y2));	
	Q294_box Share_3(.in_1(x1), .in_2(x2), .out(y3));

endmodule
