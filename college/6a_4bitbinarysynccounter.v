//Errors not resolved

module syncnt(clk,rst,b);
input clk,rst;
output [3:0]b;
reg [3:0]b;

always @(posedge clk)
begin 
    b = b+4'b0001;
end

endmodule

module test;
wire [3:0]b;
reg clk = 0;
reg rst = 0;
integer i;

syncnt s1(clk,rst,b);

initial 
begin
    for(i=0;i<20;i++)
    begin
        #5 begin 
            clk = !clk;
            /*if(i == 15)
            rst = 1;
            else
            rst = 0;*/
        end
    end
    #5 $finish;
end

always @(clk)
$strobe("At time = (%0t),clk = (%b),b = (%b)",$time,clk,b);

endmodule