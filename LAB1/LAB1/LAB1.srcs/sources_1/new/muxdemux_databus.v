`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2021 01:00:42 AM
// Design Name: 
// Module Name: muxdemux_databus
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


module muxdemux_databus #(parameter SIZE = 4)
                        (
                            input [SIZE-1:0] inpA_data,
                            input [SIZE-1:0] inpB_data,
                            input sel0_data,
                            input sel1_data,
                            input clk,
                            output wire [SIZE-1:0] left_data,
                            output wire [SIZE-1:0] right_data
                        );

// D-FF for Testing
                        
wire y0, y1, y2, q, qnot;
not(y0,sel0_data);
nand(y1,clk,y0);
nand(y2,clk,sel0_data);
nand(q,qnot,y2);
nand(qnot,q,y1);

wire y3,y4,y5,q1,q1not;
not(y3,sel1_data);
nand(y4,clk,y3);
nand(y5,clk,sel1_data);
nand(q1,q1not,y5);
nand(q1not,q1,y4);

// Instantiating muxdemux                      
genvar i;
generate
for(i = 0; i < SIZE; i = i + 1)
  begin
    muxdemux b(
                    .inpA(inpA_data[i]),
                    .inpB(inpB_data[i]),
                    .sel0(sel0_data),
                    .sel1(sel1_data),
                    .left(left_data[i]),
                    .right(right_data[i])
              );
   end
endgenerate
endmodule
