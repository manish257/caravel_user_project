`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/31/2021 01:10:14 PM
// Design Name: 
// Module Name: differentiator
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


module differentiator #(parameter word_size=8)(
    output [word_size -1:0] data_out,
    input [word_size -1:0] data_in,
    input hold,
    input clock,reset
    );
    
    reg [word_size -1:0] buffer;
    assign data_out = data_in - buffer;
    
    always@(posedge clock) 
    begin
        if (reset) 
            buffer <= 0;
        else if (hold)
            buffer <= buffer;
        else
            buffer <= data_in;
    end
endmodule
