`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2023 02:26:36 PM
// Design Name: 
// Module Name: lab6_top
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


module lab6_top(output [3:0] digits,
                output [7:0] LEDs,
                input clk,
                input [7:0] segInput,
                input [2:0] button
                );
    reg [20:0] storedMessage[7:0];
    reg [4:0] msgLen;
    reg [4:0] scrollAt;
    reg [31:0] dispMsg;
    reg [1:0] state;
    reg initConf = 1'b0;
    
    parameter SCRL = 2'b00;
    parameter LOAD = 2'b01;
    parameter CONF = 2'b10;
    parameter RSET = 2'b11;
    
    seven_segment DISP(clk,dispMsg,digits,LEDs);
    clock_divider CDIV(clk,cout);
    
    initial begin
        msgLen = 5'b00000;
        scrollAt = 5'b00000;
        dispMsg = 32'hFFFFFFFF;
    end
    
    always @(posedge cout) begin
        case (button)
            3'b110: state = LOAD;
            3'b111: state = CONF;
            3'b010: state = RSET;
            default: state = SCRL;
        endcase
        case (state)
            SCRL: begin
                scrollAt = scrollAt + 1;
                if (scrollAt > msgLen)
                    scrollAt = 0;
                if (msgLen>0) begin
                    dispMsg[31:24] = ~storedMessage[scrollAt];
                    dispMsg[23:16] = ~storedMessage[(scrollAt+1)%(msgLen+1)];
                    dispMsg[15:8] = ~storedMessage[(scrollAt+2)%(msgLen+1)];
                    dispMsg[7:0] = ~storedMessage[(scrollAt+3)%(msgLen+1)];
                end
            end
            LOAD: begin
                dispMsg[31:24] = 8'b11110001;
                dispMsg[23:8] = 16'hFFFF;
                dispMsg[7:0] = ~segInput;
                storedMessage[msgLen] = segInput;
                initConf = 1'b1;
            end
            CONF: begin
                if (initConf)
                    msgLen = msgLen + 1;
                initConf = 1'b0;
                dispMsg[31:24] = 8'b11100010;
                dispMsg[23:8] = 16'hFFFF;
                dispMsg[7:0] = ~segInput;
                scrollAt = 0;
            end
            RSET: begin
                scrollAt = 5'b00000;
                storedMessage[0] = 8'h00;
                storedMessage[1] = 8'h00;
                storedMessage[2] = 8'h00;
                storedMessage[3] = 8'h00;
                storedMessage[4] = 8'h00;
                storedMessage[5] = 8'h00;
                storedMessage[6] = 8'h00;
                storedMessage[7] = 8'h00;
                storedMessage[8] = 8'h00;
                storedMessage[9] = 8'h00;
                storedMessage[10] = 8'h00;
                storedMessage[11] = 8'h00;
                storedMessage[12] = 8'h00;
                storedMessage[13] = 8'h00;
                storedMessage[14] = 8'h00;
                storedMessage[15] = 8'h00;
                storedMessage[16] = 8'h00;
                storedMessage[17] = 8'h00;
                storedMessage[18] = 8'h00;
                storedMessage[19] = 8'h00;
                msgLen = 5'b00000;
                dispMsg = 32'hFFFFFFFF;
            end
        endcase
    end
    
endmodule