
//////////////////////////////////////////////////////////////////////////////////
// Company:		   COSIC, KU Leuven
// Engineer:	   Artemii Ovchinnikov
// 
// Create Date:    04:37:12 11/18/2022 
// Design Name:    PRINCE (td+1)-shares, 1st order secure implementation
// Module Name:    prince_top 
// Project Name:   TI with Non-Uniform Inputs
// Target Devices: 
// Tool versions: 
// Description:    https://eprint.iacr.org/2023/1517
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module prince_top (
    input  wire         clk       ,
    input  wire         reset     ,
    input  wire         start     ,
    input  wire [191:0] plaintext ,
    input  wire [383:0] key       ,
    output reg          done      ,
    output wire [191:0] ciphertext
);
    wire [191:0] k0_start         ;
    wire [191:0] k0_end           ;
    wire [191:0] k1               ;
    reg  [  5:0] counter          ; // count 36 clock cycles
    reg  [191:0] shared_state  = 0;
    wire [191:0] o_from_Abox_5    ;
    wire [191:0] o_from_Q294      ;
	reg 		 clk_en;
    wire [191:0] in_core;

    assign k0_start = {key[383:320], key[255:192], key[127:64]};
    assign k0_end   = {{key[320],key[383:322],(key[321] ^ key[383])},
        {key[192],key[255:194],(key[193] ^ key[255])},
        {key[64],key[127:66],(key[65] ^ key[127])}};	// msb
    assign k1 = {key[319:256], key[191:128], key[63:0]};	// msb

    assign ciphertext = k0_end ^ o_from_Abox_5;
	
    assign in_core = (counter == 1) ? (plaintext ^ k0_start): shared_state;
    prince_core_data d_prince_core (
        .data_in      (in_core      ),
        .counter      (counter      ),
        .key_1        (k1           ),
        .o_from_Abox_5(o_from_Abox_5),
        .o_from_Q294  (o_from_Q294  )
    );

    reg [1:0]  state      = STATE_IDLE;
    localparam STATE_IDLE = 2'h0      ;
    localparam STATE_ENC  = 2'h1      ;
    localparam STATE_DONE = 2'h2      ;

    always @(posedge clk) begin
        if (reset) begin
            state <= STATE_IDLE;
        end else begin
            case (state)
                STATE_IDLE : begin
                    done    <= 1'b0;
                    clk_en  <= 1'b0;
                    counter <= 6'b0;
                    if (start) begin
                        state   <= STATE_ENC;
                        counter <= counter + 1;
                        clk_en  <= 1'b1;

                    end
                end
                STATE_ENC : begin

                    if (counter == 36) begin
                        state   <= STATE_DONE;
                        clk_en  <= 1'b0;
                        counter <= counter;
                    end else begin
                        counter <= counter + 1;
                        clk_en  <= 1'b1;
                    end

                end
                STATE_DONE : begin
                    done   <= 1'b1;
                    clk_en <= 1'b0;
                    state  <= STATE_IDLE;
                end
            endcase
        end
    end

    always @(posedge clk) begin
        if (clk_en)
            shared_state <= o_from_Q294;
        else
            shared_state <= shared_state;
    end

endmodule 