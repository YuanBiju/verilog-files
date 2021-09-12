//Errors not resolved

module syncnt(clk,rst,b);
input clk,rst;
output [3:0]b;
reg [3:0]b = 4'b0;
wire clk,rst;

always @(posedge clk)
if(rst)
b <= 4'b0;
else
b <= b+1;

endmodule

module test;
wire [3:0]b;
reg clk = 0;
reg rst = 0;
integer i;

syncnt s1(clk,rst,b);

initial 
begin
    $dumpfile("6c_BCDsynccounter.vcd");
    $dumpvars(0,test);

    for(i=0;i<40;i++)
    begin
        #5 begin 
            clk = !clk;
            if(b == 4'h9)
            rst = 1;
            else
            rst = 0;
        end
    end
    #5 $finish;
end

always @(clk)
$strobe("At time = (%0t),clk = (%b),b = (%b)",$time,clk,b);

endmodule