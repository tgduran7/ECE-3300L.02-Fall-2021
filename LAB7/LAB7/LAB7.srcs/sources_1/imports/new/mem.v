`timescale 1ns / 1ps


module mem #(parameter DATA_WIDTH = 4, parameter ADDR_WIDTH = 3)
    (
    input clk,
    input rst,
    input wr,
    input rd,
    input [ADDR_WIDTH-1:0] addr_wr,
    input [ADDR_WIDTH-1:0] addr_rd,
    input [DATA_WIDTH-1:0] data_in,
    output reg [DATA_WIDTH-1:0] data_out
    );
    localparam RAM_DEPTH = 1<<ADDR_WIDTH;
    
    reg [DATA_WIDTH-1:0] mem [0:RAM_DEPTH-1];

    /*
    integer i;
    generate
    always@(posedge clk or posedge rst)
        begin
            if(rst)
                for(i = 0; i < RAM_DEPTH; i = i + 1)
                    mem[i] <=  'b0;
        end
    endgenerate
    */

    always@(posedge clk)
        begin: MEM_WRITE
            if (wr)
                mem[addr_wr] = data_in;
        end
        
     always@(posedge clk)
        begin
            if(rd)
                data_out = mem[addr_rd];
        end
endmodule
