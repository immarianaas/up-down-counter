`timescale 1ns / 1ps

`define assert(signal, value) \
        if (signal !== value) begin \
            $display("ASSERTION FAILED in %m: signal != value"); \
            $display("value", signal); \
            $finish; \
        end

module counter_tb;
    reg clk, reset, enable, set, up_down;
    reg [3:0] set_value;
    wire [3:0] count;

    // instantiating the module
    up_down_counter counter(clk, reset, enable, set, set_value, up_down, count);

    // Clock generation
    // always #1 clk = ~clk;

    initial 
    begin
        clk = 1'b0;
        forever 
        begin
            #5 clk = ~clk;
        end
    end

    initial begin
         reset=1'b1; 
         #6;
         reset=1'b0; end

    initial begin
        #7; // 2 after rising edge
        set = 1'b1;
        set_value= 4'b0011;
        #11; // 3 after rising edge
        `assert(count, 4'b0011);
        set = 0;
        enable = 1;
        up_down = 0;
        #8; // 1 after rising edge
        `assert(count, 4'b0010);
        enable = 1;
        up_down = 1;
        #10;
        `assert(count, 4'b0011);
        

    end

    initial begin 
        enable=0; 
        up_down=0; 
    end





endmodule;