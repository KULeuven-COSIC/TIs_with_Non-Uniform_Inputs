
//////////////////////////////////////////////////////////////////////////////////
// Company: 	   COSIC, KU Leuven
// Engineer: 	   Artemii Ovchinnikov
// 
// Create Date:    05:04:03 01/25/2023 
// Design Name: 
// Module Name:    select_register_64 
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
module select_register_64(
	input wire clk,
	input wire sel,
	input wire [63:0] state_in_1,
	input wire [63:0] state_in_2,
	output reg [63:0] state_out
);

	always @(posedge clk) begin
		if (sel == 1'b1) 
			state_out <= state_in_1;
		else 
			state_out <= state_in_2;
	end

endmodule
