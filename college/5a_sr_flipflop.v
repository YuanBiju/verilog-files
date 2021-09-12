module sr_flipflop(sr,clk,rst,q,qb);
input [1:0]sr;
input clk,rst;
output q,qb;

reg q,qb;

always @(posedge clk)
begin 
if(rst == 1)
begin q = 0;qb = 1;end
else
case(sr)
2'b00: begin q = q;qb = qb;end
2'b01: begin q = 0;qb = 1;end
2'b10: begin q = 1;qb = 0;end
2'b11: begin q = 1'bx;qb = 1'bx;end
default: begin end
endcase
end
endmodule

module test;
wire q,qb;
reg [1:0]sr = 2'b0;
reg clk = 0;
reg rst = 1;
integer i;

sr_flipflop sr1(sr,clk,rst,q,qb);

initial 
begin
    $dumpfile("5a_sr_flipflop.vcd");
    $dumpvars(0,test);

    #10 rst = 0;
    #10 sr = 2'b01;
    #10 sr = 2'b10;
    #10 sr = 2'b11;
    #10 $finish;
end

always #5 clk = !clk;

always @(clk)
$strobe("At time = (%0t),clock = (%b),rst = (%b),sr = (%b),q:qb = (%b):(%b)",$time,clk,rst,sr,q,qb);

endmodule