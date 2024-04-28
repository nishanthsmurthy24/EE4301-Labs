`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2022 10:23:52 AM
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


module lfsr (output reg [3:0] q, 
			 input [3:0] seed,
             input clock, 
             input rst);
    
    wire din;
    
    assign din = q[0]^q[1]^q[2]^q[3];
    
    always @(posedge clock, posedge rst)begin
        if(rst)
            q = seed;
        else
            q = {q[2:0], din};
    end
              
endmodule
