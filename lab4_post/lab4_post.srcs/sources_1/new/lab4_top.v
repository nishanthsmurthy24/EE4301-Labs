`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/06/2023 01:59:36 PM
// Design Name: 
// Module Name: lab4_top
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


module lab4_top(output [7:0] q,
                input clk,
                input rst,
                input [7:0] seed,
                output [3:0] an,
                output [6:0] seg);
                
    wire cout;
        
    clock_divider CDIV (clk,cout);
    lfsr LFSR (q,seed,cout,rst);
    seven_segment seg (clk, q, rst, an, seg); 

endmodule