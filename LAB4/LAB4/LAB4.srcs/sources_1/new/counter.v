`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2021 08:58:53 PM
// Design Name: 
// Module Name: counter
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


module counter(
    input clk,
    input rst,
    output reg [3:0] count
    );
    
    always@(posedge clk or posedge rst)
        begin
            if (rst)
                count <= 0;
            else if (count == 9)
                count <= 0;
            else
                count <= count + 1;
        end
    
endmodule