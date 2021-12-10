`timescale 1ns / 1ps


module bcd_loader(
    input clk,
    input rst,
    input load,
    input set,
    input digit,
    input [2:0] sel,
    input [3:0] val,
    output reg [3:0] op
    );
    
     always@(posedge clk or posedge rst or posedge load)
     begin
         if (rst)
         begin
             if (load & set & (digit == sel))
             begin
             op <= val;
             end
         end
     end
    
endmodule
