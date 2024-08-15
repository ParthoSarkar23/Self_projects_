module count60(
    input clk,
    input reset,
    input ena,
    output reg [7:0] q
);
    always @(posedge clk) begin
        if (reset) begin
            q <= 8'h00;  // Reset the counter to 00
        end
		  else if (ena) begin
            if (q[3:0] == 4'h9) begin
                q[3:0] <= 4'h0;
                if (q[7:4] == 4'h5) begin
                    q[7:4] <= 4'h0;  // If tens digit reaches 5, reset to 0
                end else begin
                    q[7:4] <= q[7:4] + 1'h1;  // Increment tens digit
                end
            end else begin
                q[3:0] <= q[3:0] + 1'h1;  // Increment units digit
            end
        end
    end
endmodule
