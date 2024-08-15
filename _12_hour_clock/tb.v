module tb;

    reg clk;
    reg reset;
    reg ena;
    wire pm;
    wire [7:0] hh;
    wire [7:0] mm;
    wire [7:0] ss;
    wire [6:0] seg_hh1, seg_hh0;
    wire [6:0] seg_mm1, seg_mm0;
    wire [6:0] seg_ss1, seg_ss0;

    // Instantiate the top module
    clockk uut (
        .clk(clk),
        .reset(reset),
        .ena(ena),
        .pm(pm),
        .hh(hh),
        .mm(mm),
        .ss(ss),
        .seg_hh1(seg_hh1),
        .seg_hh0(seg_hh0),
        .seg_mm1(seg_mm1),
        .seg_mm0(seg_mm0),
        .seg_ss1(seg_ss1),
        .seg_ss0(seg_ss0)
    );

    // Clock generation
    initial clk = 0;
  always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 1;
        ena = 0;

        // Apply reset for a short duration
        #10 reset = 0;

        // Enable counting
        ena = 1;

        // Run simulation for a short period
        
        // Stop the simulation
       
    end

    // Optional: Monitor the output values (for debugging)
    initial begin
        $monitor("Time: %0t | hh: %h | mm: %h | ss: %h | PM: %b | seg_hh1: %b | seg_hh0: %b | seg_mm1: %b | seg_mm0: %b | seg_ss1: %b | seg_ss0: %b", 
                 $time, hh, mm, ss, pm, seg_hh1, seg_hh0, seg_mm1, seg_mm0, seg_ss1, seg_ss0);
    end

endmodule
