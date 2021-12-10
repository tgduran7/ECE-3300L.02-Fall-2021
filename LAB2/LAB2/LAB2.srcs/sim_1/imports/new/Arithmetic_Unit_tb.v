`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2021 07:35:42 PM
// Design Name: 
// Module Name: Arithmetic_Unit_tb
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


module Arithmetic_Unit_tb #(parameter SIZE_TB = 16)
    (

    );

reg clk_tb;
reg rst_tb;
reg load_tb;
reg select_tb;
reg [SIZE_TB-1:0] SW_tb;
wire [SIZE_TB-1:0] LED_tb;
    
Arithmetic_Unit #(.SIZE(SIZE_TB)) UNIT_TEST
    (
    .clk(clk_tb),
    .rst(rst_tb),
    .load(load_tb),
    .select(select_tb),
    .SW(SW_tb),
    .LED(LED_tb)
    ); 
    
initial
    begin:clk_loop
        clk_tb = 0;
            forever #1
            clk_tb = ~clk_tb;                                
    end

initial

    begin: MAIN_TEST
        rst_tb <= 1;
        load_tb <= 0;
        select_tb <= 0;
        SW_tb <= 16'd0;
        
        #10 
        rst_tb <= 0;
        load_tb <= 1;
        select_tb <= 0;
        SW_tb <= 16'd10;
        
        #10 
        rst_tb <= 0;
        load_tb <= 0;
        select_tb <= 0;
        SW_tb <= 16'd5;
        
        #100 
        $finish;
        
    end
endmodule
