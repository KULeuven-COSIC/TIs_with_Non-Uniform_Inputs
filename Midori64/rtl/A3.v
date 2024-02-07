
//////////////////////////////////////////////////////////////////////////////////
// Company: 	   COSIC, KU Leuven
// Engineer: 	   Artemii Ovchinnikov
// 
// Create Date:    06:12:48 11/22/2022 
// Design Name: 
// Module Name:    A3 
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
module A3(
	input wire [3:0] x1,
	input wire [3:0] x2,
	input wire [3:0] x3,
	output wire [3:0] y1,
	output wire [3:0] y2,
	output wire [3:0] y3
);

	A3_box Share_1 (.in(x1),.out(y1));	
	A3_box Share_2 (.in(x2),.out(y2));	
	A3_box Share_3 (.in(x3),.out(y3));

endmodule
