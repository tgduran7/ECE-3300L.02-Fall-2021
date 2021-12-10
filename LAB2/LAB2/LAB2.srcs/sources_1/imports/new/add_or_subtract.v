`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2021 05:08:16 PM
// Design Name: 
// Module Name: add_or_subtract
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


module add_or_subtract #(parameter SIZE_ALU = 16)
    (
    input Sel,
    input [SIZE_ALU-1:0] A,
    input [SIZE_ALU-1:0] B,
    output [SIZE_ALU-1:0] Sum
    );
    
    wire [SIZE_ALU-1:0] F;
    wire [SIZE_ALU-1:0] C;
    
    xor(F[0], Sel, B[0]);
    
    fulladd FA0(
                .c_in(Sel),
                .a(A[0]),
                .b(F[0]),
                .sum(Sum[0]),
                .c_out(C[0])
                );
                
     genvar i;
     generate
        for (i=1; i<SIZE_ALU; i=i+1)
            begin
                xor(F[i], Sel, B[i]);
                
                fulladd FA1(
                            .c_in(C[i-1]),
                            .a(A[i]),
                            .b(F[i]),
                            .sum(Sum[i]),
                            .c_out(C[i])
                            );
            end
     endgenerate
    
endmodule
