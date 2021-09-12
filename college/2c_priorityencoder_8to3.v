module encoder_8to3(a,y);
input [7:0]a;
output [2:0]y;
reg [2:0]y;

always @(a)
begin 
    case(a)
    8'b00000001: y = 3'b000;
    8'b0000001x: y = 3'b001;
    8'b000001xx: y = 3'b010;
    8'b00001xxx: y = 3'b011;
    8'b0001xxxx: y = 3'b100;
    8'b001xxxxx: y = 3'b101;
    8'b01xxxxxx: y = 3'b110;
    8'b1xxxxxxx: y = 3'b111;
    default: y = 3'bx;
    endcase
end
endmodule

module test;
wire [2:0]y;
reg [7:0]a;

encoder_8to3 e1(a,y);

initial 
begin
    $dumpfile("2c_priorityencoder_8to3_test.vcd");
    $dumpvars(0,test); 

    #5 a = 8'b00000001;
    #5 a = 8'b0000001x;
    #5 a = 8'b000001xx;
    #5 a = 8'b00001xxx;
    #5 a = 8'b0001xxxx;
    #5 a = 8'b001xxxxx;
    #5 a = 8'b01xxxxxx;
    #5 a = 8'b1xxxxxxx;
    #5 $finish;

end

always @(a)
    $strobe("At time = (%0t) a = (%b),y = (%b)",$time,a,y);

endmodule