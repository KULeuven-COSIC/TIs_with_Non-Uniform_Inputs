
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:19:34 03/07/2023 
// Design Name: 
// Module Name:    reg64_init_pt 
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
module reg64_init_pt(
	input wire clk,
	input wire [63:0] in,
	output reg [63:0] out
);

	always @(posedge clk) begin
		out <= in;
	end

endmodule
