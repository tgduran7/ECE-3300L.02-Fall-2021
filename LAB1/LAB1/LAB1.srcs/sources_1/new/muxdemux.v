`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2021 12:49:49 AM
// Design Name: 
// Module Name: muxdemux
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


module muxdemux(
input inpA,
input inpB,
input sel0,
input sel1,
output wire left,
output wire right
);
               
// Part 1: 2x1 MUX

wire w0,w1,w2,w3,tmp1;

not gate0(w0,sel0);
and gate1(w1,inpB,w0);
and gate2(w2,inpA,sel0);
or gate3(tmp1,w1,w2);


// Part 2: 1x2 Demux
       
not gate4(w3,sel1);
and gate5(right,w3,tmp1);
and gate6(left,sel1,tmp1);

endmodule
