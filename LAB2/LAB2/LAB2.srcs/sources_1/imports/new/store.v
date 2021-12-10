`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2021 05:20:00 PM
// Design Name: 
// Module Name: store
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


module store #(parameter SIZE_STORE = 16)
    (
    input clk,
    input rst,
    input load,
    input [SIZE_STORE-1:0] initial_A,
    output reg [SIZE_STORE-1:0] out_A
    );
    
    always@(posedge clk or posedge rst)
        begin: STORE_DATA
            if(rst)
                begin
                    out_A <= 0;
                end
            else
                begin
                    if(load)
                        begin
                            out_A <= initial_A;
                        end
                end
        end
    
endmodule
