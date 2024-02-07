
//////////////////////////////////////////////////////////////////////////////////
// Company: 	   COSIC, KU Leuven
// Engineer: 	   Artemii Ovchinnikov
// 
// Create Date:    04:16:08 02/14/2023 
// Design Name: 
// Module Name:    Reg_Sbox 
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
module Reg_Sbox(
	input wire clk,
	input wire [11:0] in,
	output reg [11:0] out
);

	always @(posedge clk) begin
		out <= in;
	end

endmodule
