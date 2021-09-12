module encoder_8to3(a,y);
input [7:0]a;
output [2:0]y;
reg [2:0]y;

always @(a)
begin 
    if(a==8'b00000001) y = 3'b000;
    else if(a==8'b00000010) y = 3'b001;
    else if(a==8'b00000100) y = 3'b010;
    else if(a==8'b00001000) y = 3'b011;
    else if(a==8'b00010000) y = 3'b100;
    else if(a==8'b00100000) y = 3'b101;
    else if(a==8'b01000000) y = 3'b110;
    else if(a==8'b10000000) y = 3'b111;
    else y = 3'bx;
end
endmodule

module test;
wire [2:0]y;
reg [7:0]a;

encoder_8to3 e1(a,y);

initial 
begin
    $dumpfile("2b_encoder_8to3_test.vcd");
    $dumpvars(0,test); 

    #5 a = 8'b00000001;
    #5 a = 8'b00000010;
    #5 a = 8'b00000100;
    #5 a = 8'b00001000;
    #5 a = 8'b00010000;
    #5 a = 8'b00100000;
    #5 a = 8'b01000000;
    #5 a = 8'b10000000;
    #5 $finish;

end

always @(a)
    $strobe("At time = (%0t) a = (%b),y = (%b)",$time,a,y);

endmodule