`timescale 1ns / 1ps
module lab6_top(
output [3:0] Anode_Activate, // anode signals of the 7-segment LED display
output [7:0] LED_out, // cathode patterns of the 7-segment LED display
input clk, //100MHz Clock
input rst, //Reset
input [7:0] segIn, //7-seg switches + DP
input [2:0] State, //State Switches
output[7:0] charCount //LEDs for displaying number of characters stored
);
wire clk1HZ;
wire [31:0] characters; //Buffer for Displayed Characters
wire [7:0] loadedChar; //Buffer for last loaded Character
wire [7:0] seg;
assign seg = ~segIn; //Inverting Switches so 1 = ON for 7 seg
slow_clk_1Hz slowCLK(clk, clk1HZ);
textmover text(rst,clk,clk1HZ,seg,State,characters,loadedChar,charCount);
seven_segment SEG(clk,rst,characters,loadedChar,seg,State,Anode_Activate,LED_out);
endmodule