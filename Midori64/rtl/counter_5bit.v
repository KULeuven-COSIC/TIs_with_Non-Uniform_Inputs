
//////////////////////////////////////////////////////////////////////////////////
// Company: 	   COSIC, KU Leuven
// Engineer: 	   Artemii Ovchinnikov
// 
// Create Date:    07:30:30 01/20/2023 
// Design Name: 
// Module Name:    counter_5bit 
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
module counter_5bit(
	input wire clk,
	input wire rst,
	input wire start,
	output wire [4:0] round_counter
);
	
	localparam STATE_IDLE = 1'h0;
	localparam STATE_WORK = 1'h1;
	
	reg state = STATE_IDLE;
	
	reg [4:0] counter;
	
	always @(posedge clk) begin 
		if (rst) begin
			counter <= 5'b0;
			state <= STATE_IDLE;
		end
		else begin
			case (state)
				STATE_IDLE: begin
					if (start) begin
						state <= STATE_WORK;
					end
				end
				STATE_WORK: begin
					counter <= counter + 1'b1;
				end
			endcase
		end
	end
	
	assign round_counter = counter;

endmodule
