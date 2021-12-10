`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2021 03:00:04 PM
// Design Name: 
// Module Name: decoder2to4
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


module decoder2to4(
    input x1,
    input x0,
    input e,
    output wire d0, d1, d2, d3
    );
    
    wire x11, x00;
    not 
        inv1 (x11, x1),
        inv2 (x00, x0);
    and
        and1 (d0, x11, x00, e),
        and2 (d1, x11, x0, e),
        and3 (d2, x1, x00, e),
        and4 (d3, x1, x0, e);
    
endmodule
