`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2020 06:35:20 PM
// Design Name: 
// Module Name: bcd_counter
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


module bcd_counter(
                    input clk,
                    input rst,
                    input en_in,
                    input upd,
                    input load,
                    input set,
                    input [2:0] digit,
                    input [2:0] sel,
                    input [3:0] val,
                    output reg [3:0] op,
                    output wire en_out
                  );
always@(posedge clk or posedge rst or posedge load)
begin // 1
    if (rst)
    begin // 2
        if (upd) 
            op <= 4'd9;
        else 
            op <= 4'd0;
    end  //2
    else if (load & set & (digit == sel) & (val < 10))
        op <= val;
    else
    begin // 3
        if (en_in)
        begin // 4
            if (upd==1'b1)
            begin // 5
                if (op > 0) 
                    op <= op - 1;
                else 
                    op <= 4'd9; 
            end // 5
            else
            begin // 6
                if(op <9)
                    op <= op+1;
                else 
                    op <= 4'd0;
            end // 6
        end // 4
    end // 3
end     // 1

assign en_out = en_in & ((op[3] & op[0] & (~op[2]) & (~op[1]) & (~upd)) | ((~op[3]) & (~op[0]) & (~op[2]) & (~op[1]) & (upd))) ;
 
          
endmodule
