module fulladder(a,b,c,sum,carry);
input a,b,c;
output sum,carry;

assign sum = a^b^c;
assign carry = (a&b)|(b&c)|(c&a);
endmodule

module test;
wire sum,carry;
reg a,b,c;

fulladder f1(a,b,c,sum,carry);

initial 
begin
    $dumpfile("3a_full_adder.vcd");
    $dumpvars(0,test);

    #5 begin a=0;b=0;c=0;end
    #5 begin a=0;b=0;c=1;end
    #5 begin a=0;b=1;c=0;end
    #5 begin a=0;b=1;c=1;end
    #5 begin a=1;b=0;c=0;end
    #5 begin a=1;b=0;c=1;end
    #5 begin a=1;b=1;c=0;end
    #5 begin a=1;b=1;c=1;end
    #5 $finish;

end

always @(a or b or c)
$strobe("At time = (%0t),a = (%b),b = (%b),c = (%b),sum = (%b),carry = (%b)",$time,a,b,c,sum,carry);

endmodule