`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2021 10:03:06 PM
// Design Name: 
// Module Name: top_tb
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


module top_tb #(parameter SIZE_TB = 4)
    (

    );
    
    reg [SIZE_TB:0] SW_tb;
    reg clk_tb;
    reg rst_tb;
    reg e_tb;
    wire [15:0] LED_tb;
    
    top #(.SIZE_TOP(SIZE_TB)) top_testing
    (
        .SW(SW_tb), // 5 Switches for Speed
        .clk_top(clk_tb),
        .rst_top(rst_tb),
        .e_top(e_tb),
        .LED(LED_tb) // All 16 LED's 
    );
    
initial
    begin: clk_test
        clk_tb = 1;
    end
    always 
        begin
            #5 clk_tb = ~clk_tb;
        end
    
initial
    begin: MAIN
        SW_tb <= 5'b00000;
        #200
        SW_tb <= 5'b10011;
        #200
        SW_tb <= 5'b01010;
        #200
        SW_tb <= 5'b00101;
        #200
        SW_tb <= 5'b11100;
        
    end
endmodule
