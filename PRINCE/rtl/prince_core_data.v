
//////////////////////////////////////////////////////////////////////////////////
// Company:		   COSIC, KU Leuven
// Engineer:	   Artemii Ovchinnikov
// 
// Create Date:    04:37:12 11/18/2022 
// Design Name:    
// Module Name:    prince_core_data 
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

module prince_core_data (
    input       [191:0] data_in      ,
    input       [  5:0] counter      ,
    input       [191:0] key_1        ,
    output wire [191:0] o_from_Abox_5,
    output wire [191:0] o_from_Q294
);

    localparam SBOX_NUMBER = 16;

    genvar j;

    wire [64-1:0] rcs_0 ;
    wire [64-1:0] rcs_1 ;
    wire [64-1:0] rcs_2 ;
    wire [64-1:0] rcs_3 ;
    wire [64-1:0] rcs_4 ;
    wire [64-1:0] rcs_5 ;
    wire [64-1:0] rcs_6 ;
    wire [64-1:0] rcs_7 ;
    wire [64-1:0] rcs_8 ;
    wire [64-1:0] rcs_9 ;
    wire [64-1:0] rcs_10;
    wire [64-1:0] rcs_11;

// 	Round constants for each round
    assign rcs_0  = 64'h0000000000000000;
    assign rcs_1  = 64'h13198A2E03707344;
    assign rcs_2  = 64'hA4093822299F31D0;
    assign rcs_3  = 64'h082EFA98EC4E6C89;
    assign rcs_4  = 64'h452821E638D01377;
    assign rcs_5  = 64'hBE5466CF34E90C6C;
    assign rcs_6  = 64'h7EF84F78FD955CB1;
    assign rcs_7  = 64'h85840851F1AC43AA;
    assign rcs_8  = 64'hC882D32F25323C54;
    assign rcs_9  = 64'h64A51195E0E3610D;
    assign rcs_10 = 64'hD3B5A399CA0C2399;
    assign rcs_11 = 64'hC0AC29B7C97C50DD;

// 	registers after Multiplexers
    reg [191:0] alpha ;
    reg [191:0] beta  ;
    reg [191:0] gamma ;
    reg [191:0] delta ;
    reg [191:0] rcs_k1; // round constant XOR k1 register

    wire [191:0] to_A4;
    wire [191:0] to_A6;

    wire [191:0] from_Abox_1;
    wire [191:0] from_Abox_2;
    wire [191:0] from_Abox_3;
    wire [191:0] from_Abox_4;
    wire [191:0] from_Abox_5;
    wire [191:0] from_Abox_6;
    wire [191:0] from_M     ;
    wire [191:0] to_M       ;
    wire [191:0] from_SR    ;
    wire [191:0] to_SR      ;
    wire [191:0] from_Q294  ;


    always @(*) begin: alpha_mux
        if (counter == 6'h4 || counter == 6'h7 || counter == 6'hA || counter == 6'hD || counter == 6'h10 || counter == 6'h13)
            alpha = from_Abox_1;
        else if (counter == 6'h16 || counter == 6'h19 || counter == 6'h1C || counter == 6'h1F || counter == 6'h22 || counter == 6'h25)
            alpha = from_Abox_5;
        else
            alpha = data_in;
    end

    always @(*) begin: beta_mux
        if ((counter == 6'h4 || counter == 6'h7 || counter == 6'hA || counter == 6'hD || counter == 6'h10) ||
				(counter == 6'd12 || counter == 6'd34))
            beta = from_M;
        else if (counter == 6'd1 || counter == 6'd3 || counter == 6'd15 || counter == 6'd33)
            beta = alpha;
		  else 
				beta = alpha;
    end

    assign to_A4 = rcs_k1 ^ beta;


    always @(*) begin: round_constant
        if (counter >= 6'd1 && counter < 6'd4)
            rcs_k1 <= {{64{1'b0}}, {64{1'b0}}, rcs_0} ^ key_1;
        else if (counter >= 6'd4 && counter < 6'd7)
            rcs_k1 <= {{64{1'b0}}, {64{1'b0}}, rcs_1} ^ key_1;
        else if (counter >= 6'd7 && counter < 6'd10)
            rcs_k1 <= {{64{1'b0}}, {64{1'b0}}, rcs_2} ^ key_1;
        else if (counter >= 6'd10 && counter < 6'd13)
            rcs_k1 <= {{64{1'b0}}, {64{1'b0}}, rcs_3} ^ key_1;
        else if (counter >= 6'd13 && counter < 6'd16)
            rcs_k1 <= {{64{1'b0}}, {64{1'b0}}, rcs_4} ^ key_1;
        else if (counter >= 6'd16 && counter < 6'd19)
            rcs_k1 <= {{64{1'b0}}, {64{1'b0}}, rcs_5} ^ key_1;
        else if (counter >= 6'd22 && counter < 6'd25)
            rcs_k1 <= {{64{1'b0}}, {64{1'b0}}, rcs_6} ^ key_1;
        else if (counter >= 6'd25 && counter < 6'd28)
            rcs_k1 <= {{64{1'b0}}, {64{1'b0}}, rcs_7} ^ key_1;
        else if (counter >= 6'd28 && counter < 6'd31)
            rcs_k1 <= {{64{1'b0}}, {64{1'b0}}, rcs_8} ^ key_1;
        else if (counter >= 6'd31 && counter < 6'd34)
            rcs_k1 <= {{64{1'b0}}, {64{1'b0}}, rcs_9} ^ key_1;
        else if (counter >= 6'd34 && counter < 6'd37)
            rcs_k1 <= {{64{1'b0}}, {64{1'b0}}, rcs_10} ^ key_1;
        else if (counter == 6'd37)
            rcs_k1 <= {{64{1'b0}}, {64{1'b0}}, rcs_11} ^ key_1;
        else
            rcs_k1 <= {{64{1'b0}}, {64{1'b0}}, rcs_0};
    end


// Affine A1

    generate
        for (j = 0 ; j <= (SBOX_NUMBER-1) ; j = j + 1) begin: A1_box
            Affine_1 A1 (
                .x1(data_in[191 - 4*j : 191 - 4*j - 3]),
                .x2(data_in[191 - 4*j - 64 : 191 - 4*j - 3 - 64]),
                .x3(data_in[191 - 4*j - 128 : 191 - 4*j - 3 - 128]),
                .y1(from_Abox_1[191 - 4*j : 191 - 4*j - 3]),
                .y2(from_Abox_1[191 - 4*j - 64 : 191 - 4*j - 3 - 64]),
                .y3(from_Abox_1[191 - 4*j - 128 : 191 - 4*j - 3 - 128])
            );
        end
    endgenerate


// Affine A5

    generate
        for (j = 0 ; j <= (SBOX_NUMBER-1) ; j = j + 1) begin: A5_box
            Affine_5 A5 (
                .x1(data_in[191 - 4*j : 191 - 4*j - 3]),
                .x2(data_in[191 - 4*j - 64 : 191 - 4*j - 3 - 64]),
                .x3(data_in[191 - 4*j - 128 : 191 - 4*j - 3 - 128]),
                .y1(from_Abox_5[191 - 4*j : 191 - 4*j - 3]),
                .y2(from_Abox_5[191 - 4*j - 64 : 191 - 4*j - 3 - 64]),
                .y3(from_Abox_5[191 - 4*j - 128 : 191 - 4*j - 3 - 128])
            );
        end
    endgenerate

// Affine 4

    generate
        for (j = 0 ; j <= (SBOX_NUMBER-1) ; j = j + 1) begin: A4_box
            Affine_4 A4 (
                .x1(to_A4[191 - 4*j : 191 - 4*j - 3]),
                .x2(to_A4[191 - 4*j - 64 : 191 - 4*j - 3 - 64]),
                .x3(to_A4[191 - 4*j - 128 : 191 - 4*j - 3 - 128]),
                .y1(from_Abox_4[191 - 4*j : 191 - 4*j - 3]),
                .y2(from_Abox_4[191 - 4*j - 64 : 191 - 4*j - 3 - 64]),
                .y3(from_Abox_4[191 - 4*j - 128 : 191 - 4*j - 3 - 128])
            );
        end
    endgenerate

// Affine 3

    generate
        for (j = 0 ; j <= (SBOX_NUMBER-1) ; j = j + 1) begin: A3_box
            Affine_3 A3 (
                .x1(alpha[191 - 4*j : 191 - 4*j - 3]),
                .x2(alpha[191 - 4*j - 64 : 191 - 4*j - 3 - 64]),
                .x3(alpha[191 - 4*j - 128 : 191 - 4*j - 3 - 128]),
                .y1(from_Abox_3[191 - 4*j : 191 - 4*j - 3]),
                .y2(from_Abox_3[191 - 4*j - 64 : 191 - 4*j - 3 - 64]),
                .y3(from_Abox_3[191 - 4*j - 128 : 191 - 4*j - 3 - 128])
            );
        end
    endgenerate


// Affine 2
    generate
        for (j = 0 ; j <= (SBOX_NUMBER-1) ; j = j + 1) begin: A2_box
            Affine_2 A2 (
                .x1(alpha[191 - 4*j : 191 - 4*j - 3]),
                .x2(alpha[191 - 4*j - 64 : 191 - 4*j - 3 - 64]),
                .x3(alpha[191 - 4*j - 128 : 191 - 4*j - 3 - 128]),
                .y1(from_Abox_2[191 - 4*j : 191 - 4*j - 3]),
                .y2(from_Abox_2[191 - 4*j - 64 : 191 - 4*j - 3 - 64]),
                .y3(from_Abox_2[191 - 4*j - 128 : 191 - 4*j - 3 - 128])
            );
        end
    endgenerate



// Affine 6
    generate
        for (j = 0 ; j <= (SBOX_NUMBER-1) ; j = j + 1) begin: A6_box
            Affine_6 A6 (
                .x1(to_A6[191 - 4*j : 191 - 4*j - 3]),
                .x2(to_A6[191 - 4*j - 64 : 191 - 4*j - 3 - 64]),
                .x3(to_A6[191 - 4*j - 128 : 191 - 4*j - 3 - 128]),
                .y1(from_Abox_6[191 - 4*j : 191 - 4*j - 3]),
                .y2(from_Abox_6[191 - 4*j - 64 : 191 - 4*j - 3 - 64]),
                .y3(from_Abox_6[191 - 4*j - 128 : 191 - 4*j - 3 - 128])
            );
        end
    endgenerate

    always @(*) begin: delta_mux
        if (counter == 6'd1 || counter == 6'd4 || counter == 6'd7 || counter == 6'd10 || counter == 6'd13 || counter == 6'd16)
            delta = from_Abox_4;
        else if ((counter == 6'd2 || counter == 6'd5 || counter == 6'd8 || counter == 6'd11 || counter == 6'd14 || counter == 6'd17) ||
            (counter == 6'd20 || counter == 6'd23 || counter == 6'd26 || counter == 6'd29 || counter == 6'd32 || counter == 6'd35))
        delta = from_Abox_3;
        else if ((counter == 6'd3 || counter == 6'd6 || counter == 6'd9 || counter == 6'd12 || counter == 6'd15 || counter == 6'd18) ||
            (counter == 6'd21 || counter == 6'd24 || counter == 6'd27 || counter == 6'd30 || counter == 6'd33 || counter == 6'd36))
        delta = from_Abox_2;
        else if (counter == 6'd19 || counter == 6'd22 || counter == 6'd25 || counter == 6'd28 || counter == 6'd31 || counter == 6'd34)
            delta = from_Abox_6;
        else
            delta = from_Abox_6;
    end

    always @(*) begin: gamma_mux
        if (counter == 6'd19 || counter == 6'd4 || counter == 6'd15 || counter == 6'd16 || counter == 6'd33)
            gamma = alpha;
        else if ((counter == 6'd22 || counter == 6'd25 || counter == 6'd28 || counter == 6'd31 || counter == 6'd34) ||
					(counter == 6'd3 || counter == 6'd12 || counter == 6'd13))
            gamma = from_SR;
		  else 
				gamma = alpha;
    end

    generate
        for (j = 0 ; j < 3; j = j + 1) begin: linear_mprime_inverse_box
            linear_mprime i_linear_mprime_inverse (
                .data_in (gamma[191 - 64*j : 191 - 64*j - 63]),
                .data_out(to_A6[191 - 64*j : 191 - 64*j - 63])
            );
        end
    endgenerate

// To fed this to SR (to make M = SR*M')
    generate
        for (j = 0 ; j < 3; j = j + 1) begin: linear_mprime_box
            linear_mprime i_linear_mprime (
                .data_in(alpha[191 - 64*j : 191 - 64*j - 63]),
                .data_out(to_M[191 - 64*j : 191 - 64*j - 63])
            );
        end
    endgenerate

// SR block 
    generate
        for (j = 0 ; j < 3; j = j + 1) begin: linear_m_box
            linear_m i_linear_m (
                .data_in (to_M[191 - 64*j : 191 - 64*j - 63]),
                .data_out(from_M[191 - 64*j : 191 - 64*j - 63])
            );
        end
    endgenerate

    assign to_SR = alpha ^ rcs_k1;
	
// SR^(-1) block
    generate
        for (j = 0 ; j < 3; j = j + 1) begin: linear_m_inv_box
            linear_m_inv i_linear_m_inv (
                .data_in (to_SR[191 - 64*j : 191 - 64*j - 63]  ),
                .data_out(from_SR[191 - 64*j : 191 - 64*j - 63])
            );
        end
    endgenerate

    generate
        for (j = 0 ; j <= (SBOX_NUMBER-1) ; j = j + 1) begin: Q294_box
            Quadratic_294 Q294(
                .x1(delta[191 - 4*j : 191 - 4*j - 3]),
                .x2(delta[191 - 4*j - 64 : 191 - 4*j - 3 - 64]),
                .x3(delta[191 - 4*j - 128 : 191 - 4*j - 3 - 128]),
                .y1(from_Q294[191 - 4*j : 191 - 4*j - 3]),
                .y2(from_Q294[191 - 4*j - 64 : 191 - 4*j - 3 - 64]),
                .y3(from_Q294[191 - 4*j - 128 : 191 - 4*j - 3 - 128])
            );
        end
    endgenerate


    assign o_from_Abox_5 = from_Abox_5 ^ {{64{1'b0}}, {64{1'b0}}, rcs_11} ^ key_1;
    assign o_from_Q294   = from_Q294;

endmodule 