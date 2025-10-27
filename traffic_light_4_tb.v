`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2025 22:50:52
// Design Name: 
// Module Name: traffic_light_4_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module traffic_light_4_tb;

// Inputs
    reg CLK;
    reg CLEAR;

    // Outputs
    wire [1:0] NS, SN, EW, WE;

    // Instantiate the Unit Under Test (UUT)
    traffic_light_4 uut (
        .CLK(CLK),
        .CLEAR(CLEAR),
        .NS(NS),
        .SN(SN),
        .EW(EW),
        .WE(WE)
    );

    // Clock generation: 10ns period (100 MHz)
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;  // Toggle every 5ns
    end

    // Stimulus process
    initial begin
        // Initialize signals
        CLEAR = 1;
        #20;                   // Hold reset for 20ns
        CLEAR = 0;

        // Run simulation long enough to observe several cycles
        #400 $stop;             // Stop simulation after 200ns
    end

    // Monitor signals in console
    initial begin
        $display("Time\tState\tNS\tSN\tEW\tWE");
        $monitor("%0dns\t\t%b\t%b\t%b\t%b", $time, NS, SN, EW, WE);
    end

endmodule
