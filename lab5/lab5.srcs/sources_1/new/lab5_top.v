`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2023 03:51:26 PM
// Design Name: 
// Module Name: lab5_top
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


module lab5_top(input [3:0] seed1, seed2, 
                input clk, input rst, input Roll,
                output [3:0] Anode, output [6:0] LED_out, 
                output [4:0] sum, output [4:0] second);
    
    wire cout;
    reg [2:0] state;
    wire [3:0] q1, q2;
    wire [4:0] second, sum;

    reg [2:0] nstate;
    reg last;
    reg [4:0] sum, second;
    reg [23:0] debounce;
    
    parameter init = 3'b000; // init
    parameter rolled = 3'b001; // Rolled
    parameter ra = 3'b010; // Roll Again
    parameter loop = 3'b011; // Repeat
    parameter win = 3'b100; // Win
    parameter lose = 3'b101; // Lose
    
    clock_divider CDIV (clk,cout);
    
    initial begin 
        state = init; 
        nstate = init; 
        sum = 5'b00000; 
        second = 5'b00000; 
        last = 1'b1;
        debounce = 24'h000000; 

    end
    
    lfsr LFSR1 (q1,seed1,cout,rst);
    lfsr LFSR2 (q2,seed2,cout,rst);
    
    always@(posedge clk) begin
        case (state)
            init:  begin
                        if (Roll && last) begin 
                            nstate <= rolled; 
                            sum <= q1 + q2; 
                        end
                    end
            rolled: begin
                        if (sum > 25) begin 
                            nstate <= win; 
                        end
                        else if (sum < 5) begin 
                            nstate <= lose; 
                        end
                        else begin 
                            nstate <= ra; 
                        end
                    end
            ra: begin
                    if (Roll && last) begin 
                        second <= q1 + q2; 
                        nstate <= loop; 
                    end
                end
           loop:    begin
                        if (second > 25) begin 
                            nstate <= lose; 
                        end
                        else if (sum > second) begin 
                            nstate <= ra; 
                        end
                        else begin 
                            nstate <= win; 
                        end
                    end
            win:    begin
                    end
              
            lose:   begin
                    end
        endcase
            
        if (!Roll) begin
            debounce = debounce + 1;
            if (debounce == 0) 
                last = 1'b1;
        end
        if (Roll) begin
            last = 1'b0;
            debounce = 24'h000000;
        end
    end
    
    always@(posedge clk) begin
        if(rst)
            state <= init;
        else if(!rst && Roll)
            state <= nstate;
    end
    
    seven_segment SEG7(clk, q1, q2, state, rst, Anode, LED_out);
endmodule
