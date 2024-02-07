
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:19:05 01/20/2023 
// Design Name: 
// Module Name:    midori_control 
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
module midori_control(
	input wire clk,
	input wire rst,
	input wire start,
	output wire [3:0] round,
	output wire start_sel,
	output wire done
);

	wire [4:0] round_counter; // an actual counter for clock cycles
	
	counter_5bit actual_counter (
		.clk(clk),
		.rst(rst),
		.start(start),
		.round_counter(round_counter)
	);
	
	assign round[3:0] = round_counter[4:1];
	assign start_sel = start;
	assign done = (round_counter[4] & round_counter[3] & round_counter[2] & round_counter[1]);

endmodule
