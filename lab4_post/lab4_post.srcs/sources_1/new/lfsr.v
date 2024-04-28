`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/06/2023 01:58:12 PM
// Design Name: 
// Module Name: lfsr
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


module lfsr (output reg [7:0] q,
             input [7:0] seed,
             input clock,
             input rst);
             
    assign din = q[1]^q[2]^q[3]^q[7];
    
    always @(posedge clock, posedge rst)begin
        if(rst)
            q = seed;
        else
            q = {q[6:0], din};
    end
    

endmodule
