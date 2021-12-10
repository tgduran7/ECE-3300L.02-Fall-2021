`timescale 1ns / 1ps


module top #(parameter DATA_SIZE = 4, parameter ADDR_SIZE = 3)
          (
            input clk,
            input rst,
            input [4:0] SW,
            input [ADDR_SIZE-1:0] sel,
            input [DATA_SIZE-1:0] data,
            input wr,
            input rd,
            input upd,
            output wire [6:0] a_to_g,
            output wire [7:0] an,
            output wire dp
          );
         localparam RAM_SIZE = 1<<ADDR_SIZE;
         wire enable;
         wire clk_div;
         wire [DATA_SIZE*RAM_SIZE-1:0] reg_full;
         reg bit_sel;
         integer pick;

         clk_divider  GEN    (
                              .clk(clk),
                              .rst(rst),
                              .SW(SW), 
                              .clk_div(clk_div)
                              ); 
          /*
          always@(posedge clk or posedge rst or posedge rd)
          begin
            if (rst | rd)
            begin
                RD = 0;
                bit_sel = 0;
            end
            else
                begin
                    if (bit_sel < DATA_SIZE)
                        bit_sel = bit_sel + 1;
                    else
                        bit_sel = 0;
                        if (RD < RAM_SIZE)
                            RD = RD + 1;
                        else
                            RD = 0;
                end
          end
          */
genvar i;
generate
    for(i = 0; i < RAM_SIZE; i = i +1)
        begin
         mem #(.DATA_WIDTH(DATA_SIZE), .ADDR_WIDTH(ADDR_SIZE)) memory
                           (
                            .clk(clk),
                            .rst(rst),
                            .wr(wr),
                            .rd(rd),
                            .addr_wr(sel),
                            .addr_rd(i),
                            .data_in(data),
                            .data_out(reg_full[DATA_SIZE*(i+1)-1:DATA_SIZE*i])
                            );
                            
        end
endgenerate


          always@(posedge clk_div or posedge rst or posedge rd)
          begin
            if (rst | rd)
                pick = 0;
            else
                begin
                    if (pick < DATA_SIZE*RAM_SIZE)
                        pick = pick + 1;
                    else
                        pick = 0;
                end
          end


         seq_detect det(
                            .clk(clk_div),
                            .rst(rst),
                            .rd(rd),
                            .in(reg_full[pick]),
                            .out(enable)
                       );

          
          
         wire [31:0] TMP;                 

         bcd_32  BCD    (
                          .clk(clk_div),
                          .rst(rst),
                          .en(enable),
                          .upd(upd),
                          .count(TMP)
                          );
                          
         sdd_gen   SSD   (
                           .SW(TMP),
                           .clk(clk),
                           .rst(rst),
                           .a_to_g(a_to_g),
                           .an(an),
                           .dp(dp)
                          );                 
          initial
                begin
                    $monitor("Time = %0t; Enable = %0b", $time, enable);
                    //$monitor("Time = %0t; REG = %0b", $time, reg_full);
                    $monitor("Time = %0t; TMP = %0d", $time, TMP);
                    //$monitor("Time = %0t; a_to_g = %0d", $time, a_to_g);
                    //$monitor("Time = %0t; an = %0d", $time, an);
                end
endmodule
