`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2021 03:05:29 PM
// Design Name: 
// Module Name: decoder4to16
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


module decoder4to16 #(parameter SIZE_DEC = 4)
    (
    input [SIZE_DEC-1:0] x,
    input e,
    output [15:0] d
    );
    
    wire [3:0] tmp_d;
    
    decoder2to4 D0
    (
    .x1(x[3]),
    .x0(x[2]),
    .e(e),
    .d0(tmp_d[0]),
    .d1(tmp_d[1]),
    .d2(tmp_d[2]),
    .d3(tmp_d[3])
    );
    
    decoder2to4 D1
    (
    .x1(x[1]),
    .x0(x[0]),
    .e(tmp_d[0]),
    .d0(d[0]),
    .d1(d[1]),
    .d2(d[2]),
    .d3(d[3])
    );
    
    decoder2to4 D2
    (
    .x1(x[1]),
    .x0(x[0]),
    .e(tmp_d[1]),
    .d0(d[4]),
    .d1(d[5]),
    .d2(d[6]),
    .d3(d[7])
    );
    
    decoder2to4 D3
    (
    .x1(x[1]),
    .x0(x[0]),
    .e(tmp_d[2]),
    .d0(d[8]),
    .d1(d[9]),
    .d2(d[10]),
    .d3(d[11])
    );
    
    decoder2to4 D4
    (
    .x1(x[1]),
    .x0(x[0]),
    .e(tmp_d[3]),
    .d0(d[12]),
    .d1(d[13]),
    .d2(d[14]),
    .d3(d[15])
    );
    
endmodule
