`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/01/2023 09:48:14 PM
// Design Name: 
// Module Name: adder8
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


module adder8(
    output cout,
    output [7:0] s,
    input [7:0] a,
    input [7:0] b,
    input ctrl
    );
    
    wire [7:1] carry;
    wire cin;
    wire [7:0] b_c;
    
    assign cin = ctrl;
    
    assign b_c[0] = b[0] ^ ctrl;
    assign b_c[1] = b[1] ^ ctrl;
    assign b_c[2] = b[2] ^ ctrl;
    assign b_c[3] = b[3] ^ ctrl;
    assign b_c[4] = b[4] ^ ctrl;
    assign b_c[5] = b[5] ^ ctrl;
    assign b_c[6] = b[6] ^ ctrl;
    assign b_c[7] = b[7] ^ ctrl;
    
    full_adder FA0(carry[1], s[0], a[0], b_c[0], ctrl);
    full_adder FA1(carry[2], s[1], a[1], b_c[1], carry[1]);
    full_adder FA2(carry[3], s[2], a[2], b_c[2], carry[2]);
    full_adder FA3(carry[4], s[3], a[3], b_c[3], carry[3]);
    full_adder FA4(carry[5], s[4], a[4], b_c[4], carry[4]);
    full_adder FA5(carry[6], s[5], a[5], b_c[5], carry[5]);
    full_adder FA6(carry[7], s[6], a[6], b_c[6], carry[6]);
    full_adder FA7(cout,     s[7], a[7], b_c[7], carry[7]);
    
endmodule