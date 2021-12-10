`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2021 12:05:28 PM
// Design Name: 
// Module Name: ssd_gen
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

`define an_control 8'b11111110
`define dp_off 1'b1

module ssd_gen(
    input [4:0] SW,
    input clk,
    input rst,
    output reg [6:0] a_to_g,
    output wire [7:0] an,
    output wire dp
    );

assign an = `an_control;
assign dp = `dp_off;

wire clk_sp;

// Change Clock Speed 
clk_divider CLK_SPEED(
                    .clk(clk),
                    .rst(rst),
                    .SW(SW), 
                    .clk_div(clk_sp)
                    );

wire [3:0] out;
// Start Counter 
counter COUNTING(
    .clk(clk_sp),
    .rst(rst),
    .count(out)
    );

// 7-segment decoder: hex7seg 

always@(out)
    begin
        case(out)
            0: a_to_g = 7'b0000001;
            1: a_to_g = 7'b1001111;
            2: a_to_g = 7'b0010010;
            3: a_to_g = 7'b0000110;
            4: a_to_g = 7'b1001100;
            5: a_to_g = 7'b0100100;
            6: a_to_g = 7'b0100000;
            7: a_to_g = 7'b0001111;
            8: a_to_g = 7'b0000000;
            9: a_to_g = 7'b0000100;
//            'hA: a_to_g = 7'b0001000;
//            'hB: a_to_g = 7'b1100000;
//            'hC: a_to_g = 7'b0110001;
//            'hD: a_to_g = 7'b1000010;
//            'hE: a_to_g = 7'b0110000;
//            'hF: a_to_g = 7'b0111000;
            
        default: a_to_g = 7'bZZZZZZZ;
        
        endcase
     end
endmodule