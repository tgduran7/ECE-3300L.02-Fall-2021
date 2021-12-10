`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2021 05:24:52 PM
// Design Name: 
// Module Name: Arithmetic_Unit
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


module Arithmetic_Unit #(parameter SIZE = 16)
    (
    input clk,
    input rst,
    input load,
    input select,
    input [SIZE-1:0] SW,
    output wire [SIZE-1:0] LED
    );
    
    wire [SIZE-1:0] inp1;
    wire [SIZE-1:0] inp2;
    
    wire load0, load1;
    assign load0 = load;
    not(load1,load);
    
    store #(.SIZE_STORE(SIZE)) store0(
                                    .clk(clk),
                                    .rst(rst),
                                    .load(load0), //When load is 1, store input1
                                    .initial_A(SW),
                                    .out_A(inp1)
                                    );
    
    store #(.SIZE_STORE(SIZE)) store1(
                                .clk(clk),
                                .rst(rst),
                                .load(load1),  //When load is 0, store input2
                                .initial_A(SW),
                                .out_A(inp2)
                                );

    add_or_subtract #(.SIZE_ALU(SIZE)) ADDORSUB(
                                                .Sel(select),
                                                .A(inp1),
                                                .B(inp2),
                                                .Sum(LED)
                                                );
    
endmodule
