`timescale 1ns / 1ps

module top_tb
    (

    );
reg clk;
reg rst;
reg [4:0] SW;
reg enable;
reg upd;
wire [6:0] a_to_g;
wire [7:0] an;
wire dp;
top TOP_TEST(
            .clk(clk),
            .rst(rst),
            .SW(SW), 
            .enable(enable), 
            .upd(upd), 
            .a_to_g(a_to_g),
            .an(an),
            .dp(dp)
          );
initial
    begin
        clk = 1;
    end
    
    always
        begin
            #5 clk = ~clk;
        end
initial
                begin
                    upd = 0;
                    enable = 0;
                    rst = 1;
                   #20
                    enable = 1;
                    rst = 0;
                    for (SW = 0; SW < 32; SW = SW + 1)
                        #5;
                   #10
                    upd = 1;
                    for (SW = 0; SW < 32; SW = SW + 1)
                        #5;
                   #100
                    rst = 1;
                   #100
                    enable = 1;
                    rst = 0;
                    for (SW = 0; SW < 32; SW = SW + 1)
                        #5;
                    $finish;
                end
endmodule

