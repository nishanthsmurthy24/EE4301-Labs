`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/01/2023 10:03:17 PM
// Design Name: 
// Module Name: add8_tb
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


module add8_tb(

    );
    reg ctrl;
    reg [7:0] a, b;
    wire cout;
    wire [7:0] s;
    
    //intatiate the unit under test add8_tb
    adder8 uut(cout, s, a, b, ctrl);
    
    // stimulus (inputs)
    initial begin
        #10 // wait for global reset
        a = 8'b0000_1100; b = 8'b0000_0111; ctrl = 1'b0;
        #10
        a = 8'b0000_1100; b = 8'b0000_0111; ctrl = 1'b1;
        #10
        a = 8'b1010_1010; b = 8'b0101_0101; ctrl = 1'b0;
        #10
        a = 8'b1111_0000; b = 8'b0000_1111; ctrl = 1'b1;
    end
    
    initial begin
        #5
        $display("a = %b, b = %b, ctrl = %b",a,b,ctrl);
        $display("s = %b, cout = %b",s,cout);
        #10
        $display("a = %b, b = %b, ctrl = %b",a,b,ctrl);
        $display("s = %b, cout = %b",s,cout);
        #10
        $display("a = %b, b = %b, ctrl = %b",a,b,ctrl);
        $display("s = %b, cout = %b",s,cout);
        $display("End Simulation");    
    end        
   
endmodule
