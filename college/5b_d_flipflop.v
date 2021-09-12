module d_flipflop(d,clk,rst,q,qb);
input d;
input clk,rst;
output q,qb;

reg q,qb;

always @(posedge clk)
begin 
if(rst == 1)
begin q = 0;qb = 1;end
else
case(d)
2'b0: begin q = 0;qb = 1;end
2'b1: begin q = 1;qb = 0;end
default: begin end
endcase
end
endmodule

module test;
wire q,qb;
reg d = 0;
reg clk = 0;
reg rst = 1;
integer i;

d_flipflop d1(d,clk,rst,q,qb);

initial 
begin
    $dumpfile("5b_d_flipflop.vcd");
    $dumpvars(0,test);

    #10 rst = 0;
    #10 d = 1;
    #10 $finish;
end

always #5 clk = !clk;

always @(clk)
$strobe("At time = (%0t),clock = (%b),rst = (%b),d = (%b),q:qb = (%b):(%b)",$time,clk,rst,d,q,qb);

endmodule