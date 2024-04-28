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
                input rst);
                
    wire cout;
    reg [7:0] seed = 8'b0000_1111;
    
    clock_divider CDIV (clk,cout);
    lfsr LFSR (q,seed,cout,rst);

endmodule