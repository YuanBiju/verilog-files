module bintograyconv4bit(a,y);
input [3:0]a;
output [3:0]y;

assign y[3] = a[3];
assign y[2] = a[3]^a[2];
assign y[1] = a[2]^a[1];
assign y[0] = a[1]^a[0];

endmodule

module test;
wire [3:0]y;
reg [3:0]a;

bintograyconv4bit bg1(a,y);

initial 
begin
    $dumpfile("2e_4bit_binarytograyconverter.vcd");
    $dumpvars(0,test);

    #5 a = 4'd0;
    #5 a = 4'd1;
    #5 a = 4'd2;
    #5 a = 4'd3;
    #5 a = 4'd4;
    #5 a = 4'd5;
    #5 a = 4'd6;
    #5 a = 4'd7;
    #5 a = 4'd8;
    #5 a = 4'd9;
    #5 a = 4'd10;
    #5 a = 4'd11;
    #5 a = 4'd12;
    #5 a = 4'd13;
    #5 a = 4'd14;
    #5 a = 4'd15;
    #5 $finish;
end

always @(a)
    $strobe("At time = (%0t) a = (%b),y = (%b)",$time,a,y);

endmodule