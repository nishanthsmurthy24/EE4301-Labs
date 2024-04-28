`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2023 09:27:54 AM
// Design Name: 
// Module Name: seven_segment
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


module seven_segment(
                    input clock_100Mhz, // 100 Mhz clock source on Basys 3 FPGA
                    input [3:0] number1, number2,
                    input [2:0] state,
                    input rst, // reset
                    output reg [3:0] Anode_Activate, // anode signals of the 7-segment LED display
                    output reg [6:0] LED_out// cathode patterns of the 7-segment LED display
                    );
    
    parameter reset = 3'b000; // Reset
    parameter rolled = 3'b001; // Rolled
    parameter ra = 3'b010; // Roll Again
    parameter loop = 3'b011; // Repeat
    parameter win = 3'b100; // Win
    parameter lose = 3'b101; // Lose
                    
    reg [4:0] LED_BCD;
    reg [15:0] refresh_counter; // 20-bit for creating 10.5ms refresh period or 380Hz refresh rate
    // the first 2 MSB bits for creating 4 LED-activating signals with 2.6ms digit period
    wire [1:0] LED_activating_counter;
    // count 0 -> 1 -> 2 -> 3
    // activates LED1 LED2 LED3 LED4
    // and repeat
    always @(posedge clock_100Mhz or posedge rst) begin
        if(rst==1)
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;
    end
    
    assign LED_activating_counter = refresh_counter[15:14];
    // anode activating signals for 4 LEDs, digit period of 2.6ms
    // decoder to generate anode signals
    
    always @(*) begin
        case(LED_activating_counter)
            2'b00: begin
                Anode_Activate = 4'b0111;
                // activate LED1 and Deactivate LED2, LED3, LED4
                LED_BCD = {1'b0,number1};
                // the first digit of the 16-bit number
            end
            2'b01: begin
                Anode_Activate = 4'b1011;
                // activate LED2 and Deactivate LED1, LED3, LED4
                LED_BCD = {1'b0, number2};
                // the second digit of the 16-bit number
            end
            2'b10: begin
                Anode_Activate = 4'b1101;
                // activate LED3 and Deactivate LED2, LED1, LED4
                if(state == win) begin
                    LED_BCD = 5'b10000; // "U"
                end
                else if(state == lose) begin
                    LED_BCD = 5'b10010; // "L"
                end
                else if(state == ra) begin
                end
                else begin
                    LED_BCD = 5'b10101; // NULL
                end
                // the third digit of the 16-bit number
            end
            2'b11: begin
                Anode_Activate = 4'b1110;
                // activate LED4 and Deactivate LED2, LED3, LED1
                if(state == win) begin
                    LED_BCD = 5'b10001; // "I"
                end
                else if(state == lose) begin
                    LED_BCD = 5'b10011; // "L"
                end
                else if(state == ra) begin
                    LED_BCD = 5'b10011; // "R"
                end
                else begin
                    LED_BCD = 5'b10101; // NULL
                end
                // the fourth digit of the 16-bit number
            end
        endcase
    end
    
    // Cathode patterns of the 7-segment LED display
    always @(*) begin
        case(LED_BCD)
            5'b00000: LED_out = 7'b0000001; // "0"
            5'b00001: LED_out = 7'b1001111; // "1"
            5'b00010: LED_out = 7'b0010010; // "2"
            5'b00011: LED_out = 7'b0000110; // "3"
            5'b00100: LED_out = 7'b1001100; // "4"
            5'b00101: LED_out = 7'b0100100; // "5"
            5'b00110: LED_out = 7'b0100000; // "6"
            5'b00111: LED_out = 7'b0001111; // "7"
            5'b01000: LED_out = 7'b0000000; // "8"
            5'b01001: LED_out = 7'b0000100; // "9"
            5'b01010: LED_out = 7'b0001000; // "a"
            5'b01011: LED_out = 7'b1100000; // "b"
            5'b01100: LED_out = 7'b0110001; // "c"
            5'b01101: LED_out = 7'b1000010; // "d"
            5'b01110: LED_out = 7'b0110000; // "e"
            5'b01111: LED_out = 7'b0111000; // "f"
            5'b10000: LED_out = 7'b1000001; // "U"
            5'b10001: LED_out = 7'b1111001; // "I"
            5'b10010: LED_out = 7'b1110001; // "L"
            5'b10011: LED_out = 7'b1100010; // "o"
            5'b10100: LED_out = 7'b0001000; // "R"
            5'b10101: LED_out = 7'b1111111; // NULL
        endcase
    end
endmodule
