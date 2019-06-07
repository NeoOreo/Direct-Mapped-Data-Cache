`timescale 1ns / 1ns

module top_level(clk, rst, address_in, cnt);
    input clk,rst;
    input [14:0] address_in;
    output [14:0] cnt;
    //output [31:0] out;
    //wire [31:0] a, b, c, d;
    wire [31:0] miss_data4, miss_data3, miss_data2, miss_data1;
    //wire [1:0] sel;
    //Mux mux(d, c, b, a, sel, out);
    cache ch(clk, rst, address_in, miss_data4, miss_data3, miss_data2, miss_data1, cnt);
    MainMem m(address_in, miss_data4, miss_data3, miss_data2, miss_data1);
endmodule




module TopLevelTB();
    reg clk = 0, rst = 0;
    reg [14:0] addressIn = 15'd1000;
    //wire [31:0] out;
    wire [14:0] cnt;
    top_level ut(clk ,rst, addressIn, cnt);
    always #50 clk = ~clk;
    always @(posedge clk)
        addressIn = addressIn + 15'd1;
    always @ ( * ) begin
        if (addressIn == 15'd8001) begin
            $stop;
        end
    end
    initial begin
        rst = 1;
        #50;
        rst = 0;
    end


endmodule
