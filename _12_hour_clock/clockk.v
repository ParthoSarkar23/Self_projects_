module clockk(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output [7:0] mm,
    output  [7:0] ss,
    output [6:0] seg_hh1, seg_hh0,  // Seven-segment display outputs for hh
    output [6:0] seg_mm1, seg_mm0,  // Seven-segment display outputs for mm
    output [6:0] seg_ss1, seg_ss0   // Seven-segment display outputs for ss
); 

    wire [2:0] ena_hms;  // Determine when "ss", "mm" and "hh" need to be increased
    assign ena_hms = {(ena && (mm == 8'h59) && (ss == 8'h59)), (ena && (ss == 8'h59)), ena}; 
	//reg [2:0] ena_hms=0;
    
    count60 count_ss(
        .clk(clk),
        .reset(reset),
        .ena(ena_hms[0]),
        .q(ss)
    );
    count60 count_mm(
        .clk(clk),
        .reset(reset),
        .ena(ena_hms[1]),
        .q(mm)
    );

    
    always @(posedge clk) begin
        if(reset) begin
            hh <= 8'h12;    // hh = 12
            pm <= 0;
        end
        else begin
            if(ena_hms[2] && (mm == 8'h59) && (ss == 8'h59)) begin  // if mm = 59 and ss = 59
                if(hh == 8'h12) hh <= 8'h1; // hh changes: 12AM -> 1AM or 12PM -> 1PM  
                else if(hh == 8'h11) begin  // if hh = 11, PM -> AM or AM -> PM
                    hh[3:0] <= hh[3:0] + 1'h1; // hh = 12
                    pm <= ~pm;
                end 
                else begin
                    if(hh[3:0] == 4'h9) begin
                        hh[3:0] <= 4'h0;
                        hh[7:4] <= hh[7:4] + 1'h1;
                    end
                    else hh[3:0] = hh[3:0] + 1'h1;
                end
            end
            else hh <= hh;
        end
    end

    // Instantiate BCD to seven-segment modules for each digit
    bcd_to_7seg digit_hh1 (.bcd(hh[7:4]), .seg(seg_hh1));
    bcd_to_7seg digit_hh0 (.bcd(hh[3:0]), .seg(seg_hh0));
    bcd_to_7seg digit_mm1 (.bcd(mm[7:4]), .seg(seg_mm1));
    bcd_to_7seg digit_mm0 (.bcd(mm[3:0]), .seg(seg_mm0));
    bcd_to_7seg digit_ss1 (.bcd(ss[7:4]), .seg(seg_ss1));
    bcd_to_7seg digit_ss0 (.bcd(ss[3:0]), .seg(seg_ss0));

endmodule