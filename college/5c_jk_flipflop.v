module jk_flipflop(jk,clk,rst,q,qb);
input [1:0]jk;
input clk,rst;
output q,qb;

reg q,qb;

always @(posedge clk)
begin 
if(rst == 1)
begin q = 0;qb = 1;end
else
case(jk)
2'b00: begin q = q;qb = qb;end
2'b01: begin q = 0;qb = 1;end
2'b10: begin q = 1;qb = 0;end
2'b11: begin q = ~(q);qb = ~(qb);end
default: begin end
endcase
end
endmodule

module test;
wire q,qb;
reg [1:0]jk = 2'b0;
reg clk = 0;
reg rst = 1;

jk_flipflop jk1(jk,clk,rst,q,qb);

initial 
begin
    $dumpfile("5c_jk_flipflop.vcd");
    $dumpvars(0,test);

    #10 rst = 0;
    #10 jk = 2'b01;
    #10 jk = 2'b10;
    #10 jk = 2'b11;
    #10 $finish;
end

always #5 clk = !clk;

always @(clk)
$strobe("At time = (%0t),clock = (%b),rst = (%b),jk = (%b),q:qb = (%b):(%b)",$time,clk,rst,jk,q,qb);

endmodule