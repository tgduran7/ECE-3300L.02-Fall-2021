`timescale 1ns / 1ps

`define one1 2'b00
`define one0 2'b01
`define one0_one1 2'b10
`define one0_two1s 2'b11

module seq_detect(
    input clk,
    input rst,
    input rd,
    input in,
    output out
    );
    
    reg out;
    reg [1:0] state;
    reg [1:0] next_state;
    always@(posedge clk or posedge rst or posedge rd)
    if(rst | rd)
        state = `one1;
    else
        state = next_state;
    
    always@(in or state)
    case(state)
    `one1:
        begin
            if(~in)
                next_state = `one0;
            else
                next_state = `one1;
        end
    `one0:
        begin
            if(in)
                next_state = `one0_one1;
            else
                next_state = `one1;
        end
    `one0_one1:
        begin
            if(in)
                next_state = `one0_two1s;
            else
                next_state = `one1;
        end
    `one0_two1s:
        begin
            if(~in)
                next_state = `one0;
            else
                next_state = `one1;
        end
    endcase    
        always@(state)
            case(state)
                `one1: out = 0;
                `one0: out = 0;
                `one0_one1: out = 0;
                `one0_two1s: out = 1;
            endcase    
            
            initial
                begin
                $monitor("Time = %0t; out = %0b", $time, out);
                $monitor("Time = %0t; state = %0b", $time, state);
                end
endmodule
