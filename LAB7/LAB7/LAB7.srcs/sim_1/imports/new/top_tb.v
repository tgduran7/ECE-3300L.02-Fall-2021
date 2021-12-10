`timescale 1ns / 1ps
module top_tb #(parameter DATA_TB = 4, parameter ADDR_TB = 3)
            ();

            reg clk;
            reg rst;
            reg [4:0] SW; 
            reg [ADDR_TB-1:0] sel;
            reg [DATA_TB-1:0] data; 
            reg wr;
            reg rd;
            reg upd;
            wire [6:0] a_to_g;
            wire [7:0] an;
            wire dp;
            
            top #(.DATA(DATA_TB), .ADDR(ADDR_TB)) test
                ( .clk(clk),
                  .rst(rst),
                  .SW(SW),
                  .sel(sel),
                  .data(data),
                  .wr(wr),
                  .rd(rd),
                  .upd(upd),
                  .a_to_g(a_to_g),
                  .an(an),
                  .dp(dp) );
            
            initial
                begin: INIT_CLK
                    clk = 1;
                end
                
                always
                    begin
                        #5 clk = ~clk;
                    end
             initial
                begin
                    upd = 0;
                    rd = 0;
                    wr = 0;
                    rst = 1;
                    SW = 0;
                    #20
                    rst = 0;
                    rd = 1;
                    #20;
                    rd = 0;
                    wr = 1;
                    
                    data = 4'b0110;
                    sel = 3'b000;
                   #20
                    data <= 4'b1011;
                    sel <= 3'b001;
                   #20
                    data <= 4'b1101;
                    sel <= 3'b010;
                   #20
                    data <= 4'b0000;
                    sel <= 3'b011;
                   #20
                    data <= 4'b1010;
                    sel <= 3'b100;
                   #20
                    data <= 4'b0001;
                    sel <= 3'b101;
                   #20
                    data <= 4'b1100;
                    sel <= 3'b110;
                   #20
                    data <= 4'b1101;
                    sel <= 3'b111;
                   #20
                   wr = 0;
                   rd = 1;
                   #20
                   rd = 0;
                   
                   #1000
                    $finish;
                end
endmodule
