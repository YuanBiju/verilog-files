module decoder(a,y);
input [1:0] a;
output [3:0]y;
reg [3:0]y = 4'b1111;
always@(a)
case(a)
2'b00:y=4'b1110;
2'b01:y=4'b1101;
2'b10:y=4'b1011;
2'b11:y=4'b0111;
endcase
endmodule

module test;
wire [3:0]y = 4'b0000;
reg [1:0]a = 2'b00;
decoder d1(a,y);

initial begin
    $dumpfile("2a_decoder_test.vcd");
    $dumpvars(0,test);

    #5 a = 2'b01;
    #5 a = 2'b10;
    #5 a = 2'b11;
    #5 $finish;
end

always @(a)
    $strobe("At time = (%0t) a = (%b),y = (%b)",$time,a,y);

endmodule