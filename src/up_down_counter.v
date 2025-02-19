module up_down_counter(clk, reset, enable, set, set_value, up_down, count);
    input wire clk;
    input wire reset;
    input wire enable;
    input wire set;
    input wire [3:0] set_value;
    input wire up_down; // 1 for up, 0 for down
    output wire [3:0] count;

    reg [3:0] value;
    
    assign count = value;

    always @(posedge clk) begin
        // value <= 4'b1010;
        if (reset) 
            value <= 4'b0000;
        if (set)
            value <= set_value;
        else if (enable)
            value <= up_down == 1 ? value + 1 : value - 1; 
    end

endmodule