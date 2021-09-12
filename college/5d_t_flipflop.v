module t_flipflop(t,clk,rst,q,qb);
input t;
input clk,rst;
output q,qb;

reg q,qb;

always @(posedge clk)
begin 
if(rst == 1)
begin q = 0;qb = 1;end
else
case(t)
0: begin q = q;qb = qb;end
1: begin q = ~(q);qb = ~(qb);end
default: begin end
endcase
end
endmodule

module test;
wire q,qb;
reg t = 0;
reg clk = 0;
reg rst = 1;

t_flipflop jk1(t,clk,rst,q,qb);

initial 
begin
    $dumpfile("5d_t_flipflop.vcd");
    $dumpvars(0,test);

    #10 rst = 0;
    #10 t = 1;
    #20 $finish;
end

always #5 clk = !clk;

always @(clk)
$strobe("At time = (%0t),clock = (%b),rst = (%b),t = (%b),q:qb = (%b):(%b)",$time,clk,rst,t,q,qb);

endmodule