module multiplexer_8to1(a,sel,y);
input [2:0]sel;
input [7:0]y;
output a;
reg a;

always @(a,sel)
begin
    y = 8'b0;
    case(sel)
    3'b000: a = y[0];
    3'b001: a = y[1];
    3'b010: a = y[2];
    3'b011: a = y[3];
    3'b100: a = y[4];
    3'b101: a = y[5];
    3'b110: a = y[6];
    3'b111: a = y[7];
    default: y=8'bx;
    endcase
end
endmodule

module test;
wire [7:0]y = 8'd72;
reg a;
reg [2:0]sel;

multiplexer_8to1 m1(a,sel,y);

initial 
begin
    $dumpfile("2d_multiplexer_8to1_test.vcd");
    $dumpvars(0,test); 

    #5 sel = 3'b000;
    #5 sel = 3'b001;
    #5 sel = 3'b010;
    #5 sel = 3'b011;
    #5 sel = 3'b100;
    #5 sel = 3'b101;
    #5 sel = 3'b110;
    #5 sel = 3'b111;
    #5 $finish;
end

always @(a,sel)
    $strobe("At time = (%0t) a = (%b),sel = (%b),y = (%b)",$time,a,sel,y);

endmodule