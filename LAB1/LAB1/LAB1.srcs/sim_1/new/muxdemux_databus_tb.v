`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2021 04:45:51 AM
// Design Name: 
// Module Name: muxdemux_databus_tb
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


module muxdemux_databus_tb #(parameter SIZE_TB=4)();

reg [SIZE_TB-1:0] inpA_tb, inpB_tb;
reg sel0_tb, sel1_tb, clk_tb;
wire [SIZE_TB-1:0] left_tb, right_tb;

muxdemux_databus #(.SIZE(SIZE_TB)) muxdemux_testbench
(
.inpA_data(inpA_tb),
.inpB_data(inpB_tb),
.sel0_data(sel0_tb),
.sel1_data(sel1_tb),
.clk(clk_tb),
.left_data(left_tb),
.right_data(right_tb)
);

// Clock 

initial
    begin: clk_signal
    clk_tb = 0;
        forever #1 
        clk_tb = ~clk_tb;
    end
    
// Testbench
initial
    begin: testing
        inpA_tb <= 4'd15;
        inpB_tb <= 4'd1;
        sel0_tb <= 1'b0;
        sel1_tb <= 1'b0;
     #10
        inpA_tb <= 4'd2;
        inpB_tb <= 4'd1;
        sel0_tb <= 1'b0;
        sel1_tb <= 1'b1;
        
     #10 
        inpA_tb <= 4'd2;
        inpB_tb <= 4'd8;
        sel0_tb <= 1'b1;
        sel1_tb <= 1'b0;
        
     #10 
        inpA_tb <= 4'd5;
        inpB_tb <= 4'd8;
        sel0_tb <= 1'b1;
        sel1_tb <= 1'b1;
     
     #100
     
     $finish;
     end

endmodule
