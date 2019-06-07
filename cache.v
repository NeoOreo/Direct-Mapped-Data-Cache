`timescale 1ns / 1ns
module cache(clk, rst, address_in, miss_data4, miss_data3, miss_data2, miss_data1, cnt);
    input rst, clk;
    reg h_or_m;
    input [31:0] miss_data1, miss_data2, miss_data3, miss_data4;
    input [14:0] address_in;
    reg [4*32 + 3:0] ROM[0:999];
    wire [2:0] tag  = address_in[14:12];
    wire [9:0] index  = address_in[11:2];
    //output [1:0] sel;
    //assign sel = address_in[1:0];
    //output [31:0] w3, w2, w1, w0;
    output reg [14:0] cnt = 0;

    integer i;
    //assign {w3, w2, w1, w0} = {ROM[index][127: 96], ROM[index][95: 64], ROM[index][63:32], ROM[index][31:0]};
    always @ ( * ) begin
        h_or_m = 0;
        if (ROM[index][131] != 0)
            if(ROM[index][130:128] == tag)
                h_or_m = 1;
    end

    always @ (posedge clk, posedge rst) begin
        if(rst)
            for (i = 0; i < 1000; i = i + 1)
                ROM[i] = 132'b0;
        else begin
            if(h_or_m == 0) begin
                ROM[index] = {1'b1, tag, miss_data4, miss_data3, miss_data2, miss_data1};
            end
            else
                cnt = cnt + 1;
        end

    end
endmodule


/*
module cahceTB ();
    reg clk = 0, rst = 0;
    reg [14:0] address_in;
    reg [31:0] miss_data1,miss_data2,miss_data3,miss_data4;
    wire [1:0] sel;
    wire [31:0] w3, w2, w1, w0;
    always #50 clk = ~clk;
    cache ut(clk, rst, address_in, miss_data4, miss_data3, miss_data2, miss_data1, sel, w3, w2, w1, w0);

    initial begin
        rst = 1;
        #100;
        rst = 0;
        address_in = 15'b000000000000001;
        miss_data3 = 32'd10;
        miss_data2 = 32'd12;
        miss_data1 = 32'd14;
        miss_data4 = 32'd16;
        #100;
        miss_data3 = 32'd100;
        miss_data2 = 32'd120;
        miss_data1 = 32'd140;
        miss_data4 = 32'd160;
        #100;
        address_in = 15'b000000000000011;
        #100;
        address_in = 15'b000000000000000;
        #100;
        address_in = 15'b000000000000100;
        #2000
        $stop;
    end
endmodule
*/
