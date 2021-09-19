module halfadder(a,b,sum,carry);
input a,b;
output sum,carry;

assign sum = a^b;
assign carry = (a&b);
endmodule

module test;
wire sum,carry;
reg a,b;

halfadder f1(a,b,sum,carry);

initial 
begin
    $dumpfile("7_halfadder.vcd");
    $dumpvars(0,test);

    #5 begin a=0;b=0;end
    #5 begin a=0;b=1;end
    #5 begin a=1;b=0;end
    #5 begin a=1;b=1;end
    #5 $finish;

end

always @(a or b)
$strobe("At time = (%0t),a = (%b),b = (%b),sum = (%b),carry = (%b)",$time,a,b,sum,carry);

endmodule