`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2021 03:11:36 PM
// Design Name: 
// Module Name: top
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


module top #(parameter SIZE_TOP = 4)
    (
        input [4:0] SW, // 5 Switches for Speed
        input clk_top,
        input rst_top,
        input e_top,
        output wire [15:0] LED // All 16 LED's 
    );

wire [SIZE_TOP-1:0] tmp;
    
clk_divider #(.SIZE_CLK(SIZE_TOP)) CLKDIV
              (
                .clk(clk_top),
                .rst(rst_top),
                .mux_cont(SW), // Choose Speed with the switches
                .count(tmp) // Resulting Speed
              );
              
decoder4to16 #(.SIZE_DEC(SIZE_TOP)) DEC
    (
    .x(tmp), // Resulting Speed goes into Decoder
    .e(e_top),
    .d(LED)
    );
    
endmodule
