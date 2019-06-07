`timescale 1ns / 1ns
module MainMem(input signed [14:0] addressIn, output [31:0] w3, w2, w1, w0);
    reg [31:0] RAM [0:32000 - 1];
    initial begin
        $readmemb("C:/Users/Mahdi/Desktop/ca5/MainMemory.mem", RAM);
    end

    assign {w3, w2, w1, w0} = {RAM[addressIn + (15'd3 - {13'd0, addressIn[1:0]})], RAM[addressIn + (15'd2 - {13'd0, addressIn[1:0]})], RAM[addressIn + (15'd1 - {13'd0, addressIn[1:0]})], RAM[addressIn + (15'd0 - {13'd0, addressIn[1:0]})]};

endmodule
/*
module MainMemTB();
    reg [14:0] addressIn;
    wire [31:0] w3, w2, w1, w0;
    MainMem ut(addressIn, w3, w2, w1, w0);
    initial begin
        addressIn = 15'b000000000000000;
        #1000;
        addressIn = 15'b000000000000011;
        #1000;
        addressIn = 15'b000000000000010;
        #1000;
        addressIn = 15'b000000000001001;
        #1000;
        $stop;
    end
endmodule
*/
