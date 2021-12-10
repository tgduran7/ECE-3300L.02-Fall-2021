`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2021 03:09:15 PM
// Design Name: 
// Module Name: clk_divider
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


module clk_divider #(parameter SIZE_CLK = 4)
              (
                input clk,
                input rst,
                input [4:0] mux_cont,
                output reg [SIZE_CLK-1:0] count
              );
              
              reg clk_div;
              reg [31:0] count_temp;
              
              always@(posedge clk or posedge rst)
                begin: GEN_COUNT_CLK
                    if(rst)
                        count_temp = 0;
                    else
                        count_temp = count_temp + 1;
                end
              
              always@(mux_cont)
                begin: Selecting_speed // 32 Speeds
                    case(mux_cont)
                    0: clk_div <= count_temp[0];
                    1: clk_div <= count_temp[1];
                    2: clk_div <= count_temp[2];
                    3: clk_div <= count_temp[3];
                    4: clk_div <= count_temp[4];
                    5: clk_div <= count_temp[5];
                    6: clk_div <= count_temp[6];
                    7: clk_div <= count_temp[7];
                    8: clk_div <= count_temp[8];
                    9: clk_div <= count_temp[9];
                    10: clk_div <= count_temp[10];
                    11: clk_div <= count_temp[11];
                    12: clk_div <= count_temp[12];
                    13: clk_div <= count_temp[13];
                    14: clk_div <= count_temp[14];
                    15: clk_div <= count_temp[15];
                    16: clk_div <= count_temp[16];
                    17: clk_div <= count_temp[17];
                    18: clk_div <= count_temp[18];
                    19: clk_div <= count_temp[19];
                    20: clk_div <= count_temp[20];
                    21: clk_div <= count_temp[21];
                    22: clk_div <= count_temp[22];
                    23: clk_div <= count_temp[23];
                    24: clk_div <= count_temp[24];
                    25: clk_div <= count_temp[25];
                    26: clk_div <= count_temp[26];
                    27: clk_div <= count_temp[27];
                    28: clk_div <= count_temp[28];
                    29: clk_div <= count_temp[29];
                    30: clk_div <= count_temp[30];
                    31: clk_div <= count_temp[31];
                    
                    default: clk_div <= 1'bZ; //default for emergency
                    endcase
                end
              
              always@(posedge clk_div)
                begin: Counter_for_Decoder
                    if(rst)
                        count <= 0;
                    else
                        count <= count + 1;
                end
              
endmodule
