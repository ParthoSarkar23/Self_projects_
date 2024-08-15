
module bcd_to_7seg(
    input [3:0] bcd,    // BCD digit (0-9)
    output reg [6:0] seg  // Seven-segment display output
);
    always @(*) begin
        case(bcd)
            4'h0: seg = 7'b0111111;
            4'h1: seg = 7'b0000110;
            4'h2: seg = 7'b1011011;
            4'h3: seg = 7'b1001111;
            4'h4: seg = 7'b1100110;
            4'h5: seg = 7'b1101101;
            4'h6: seg = 7'b1111101;
            4'h7: seg = 7'b0000111;
            4'h8: seg = 7'b1111111;
            4'h9: seg = 7'b1101111;
            default: seg = 7'b0000000; // Turn off all segments for invalid input
        endcase
    end
endmodule
