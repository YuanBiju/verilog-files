module demultiplexer1to8(a,sel,y);
input a;
input [2:0]sel;
output [7:0]y;
reg [7:0]y;

always @(a,sel)
begin
    y = 8'b0;
    case(sel)
    3'b000: y[0] = a;
    3'b001: y[1] = a;
    3'b010: y[2] = a;
    3'b011: y[3] = a;
    3'b100: y[4] = a;
    3'b101: y[5] = a;
    3'b110: y[6] = a;
    3'b111: y[7] = a;
    default: y=8'bx;
    endcase
end

endmodule

module test;
wire [7:0]y;
reg a = 1'b1;
reg [2:0]sel;

demultiplexer1to8 d1(a,sel,y);

initial begin
    $dumpfile("2f_demultiplexer_1to8.vcd");
    $dumpvars(0,test);

    #5 sel = 3'd0;
    #5 sel = 3'd1;
    #5 sel = 3'd2;
    #5 sel = 3'd3;
    #5 sel = 3'd4;
    #5 sel = 3'd5;
    #5 sel = 3'd6;
    #5 sel = 3'd7;
    #5 $finish;

end

always @(a,sel)
$strobe("At time = (%0t),a = (%b),sel = (%b),y = (%b)",$time,a,sel,y);

endmodule

