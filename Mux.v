`timescale 1ns / 1ns
module Mux(input [31:0] d, c, b, a, input [1:0] sel, output [31:0] out);
    reg [31:0] outTemp;
    always @ ( * ) begin
        case (sel)
            0: outTemp = a;
            1: outTemp = b;
            2: outTemp = c;
            3: outTemp = d;
            default: outTemp = a;
        endcase
    end
    assign out = outTemp;
endmodule
/*
module MuxTB();
    reg [31:0] d = 32'd300, c = 32'd200, b = 32'd100, a = 32'd0;
    reg [1:0] sel;
    wire [31:0] out;
    Mux ut(d, c, b, a, sel, out);

    initial begin
        sel = $urandom % 4;
        #1000;
        sel = $urandom % 4;
        #1000;
        $stop;
    end
endmodule
*/
