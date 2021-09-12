module alu(a,b,opcode,y);
input [31:0]a;
input [31:0]b;
input [3:0]opcode;
output [31:0]y;
reg [31:0]y;

always @(a or b or opcode)
begin
    case(opcode)
    4'd0: y = a+b;
    4'd1: y = a-b;
    4'd2: y = ~a;
    4'd3: y = a&b;
    4'd4: y = a|b;
    4'd5: y = ~(a&b);
    4'd6: y = ~(a|b);
    4'd7: y = a^b;
    4'd8: y = ~(a^b);
    4'd9: y = a;
    4'd10: y = 32'b0;
    4'd11: y = 32'b1;
    4'd12: y = a+1;
    4'd13: y = a-1;
    4'd14: y = b+1;
    4'd15: y = b-1;
    default: y = 32'bx;
    endcase
end
endmodule

module test;
wire [31:0]y;
reg [31:0]a = 32'd12;
reg [31:0]b = 32'd15;
reg [3:0]opcode;

integer i = 0;

alu a1(a,b,opcode,y);

initial begin
    $dumpfile("4_alu.vcd");
    $dumpvars(0,test);

    opcode = 4'd0;

    for(i=0;i<16;i++)
    begin
        #5 opcode = opcode+1;
    end

    #5 $finish;
end

always @(a,b,opcode)
$strobe("At time = (%0t),a = (%h),b = (%h),opcode = (%d),y = (%h)",$time,a,b,opcode,y);

endmodule