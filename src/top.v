`default_nettype none

module tt_um_counter_top_immarianaas (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    // instantiating the module
    // up_down_counter counter(clk, reset, enable, set, set_value, up_down, count);
    up_down_counter counter(clk, rst_n, ena, ui_in[0], ui_in[4:1], ui_in[5], uo_out[3:0]);
    assign uio_out = 0;
    assign uio_oe = 0;


endmodule;