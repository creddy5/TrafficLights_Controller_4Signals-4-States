`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2025 22:45:35
// Design Name: 
// Module Name: traffic_light_4
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


module traffic_light_4(
 input CLK,
    input CLEAR,
    output reg [1:0] NS, SN, EW, WE
    );
     // Light codes
    parameter RED    = 2'b00;
    parameter YELLOW = 2'b01;
    parameter GREEN  = 2'b10;

    // Directions
    parameter NS_DIR = 2'd0;
    parameter EW_DIR = 2'd1;
    parameter SN_DIR = 2'd2;
    parameter WE_DIR = 2'd3;

    // Timing delays (in clock cycles)
    parameter GREEN_DELAY  = 5;
    parameter YELLOW_DELAY = 2;

    reg [1:0] state;     // Current direction: 0-3
    reg green_phase;      // 0 = Green, 1 = Yellow
    reg [3:0] counter;    // Counter for delay timing
       // Initialization
    initial begin
        state = NS_DIR;
        green_phase = 0;
        counter = 0;
    end

    // FSM with counter-based delays
    always @(posedge CLK or posedge CLEAR) begin
        if (CLEAR) begin
            state <= NS_DIR;
            green_phase <= 0;
            counter <= 0;
        end else begin
            counter <= counter + 1;

            if (green_phase == 0 && counter == GREEN_DELAY) begin
                green_phase <= 1; // Switch to Yellow
                counter <= 0;
            end
            else if (green_phase == 1 && counter == YELLOW_DELAY) begin
                green_phase <= 0; // Next Green
                counter <= 0;
                state <= state + 1;
                if (state == WE_DIR) state <= NS_DIR; // Wrap around
            end
        end
    end

     // Output logic based on state and phase
    always @(*) begin
        NS = RED; SN = RED; EW = RED; WE = RED;

        case (state)
            NS_DIR: NS = green_phase ? YELLOW : GREEN;
            EW_DIR: EW = green_phase ? YELLOW : GREEN;
            SN_DIR: SN = green_phase ? YELLOW : GREEN;
            WE_DIR: WE = green_phase ? YELLOW : GREEN;
        endcase
    end

endmodule
