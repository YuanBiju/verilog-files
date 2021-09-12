module comparator(a,b,l,e,g);
input [3:0]a;
input [3:0]b;
output l,e,g;
reg l,e,g;

always @(a,b)
begin
    if(a < b)
    l = 1'b1;
    else
    l = 1'b0;

    if(a == b)
    e = 1'b1;
    else
    e = 1'b0;

    if(a>b)
    g = 1'b1;
    else
    g = 1'b0;
end
endmodule

module test;
wire l,e,g;
reg [3:0]a;
reg [3:0]b;


comparator c1(a,b,l,e,g);

initial
begin
    $dumpfile("2g_comparator.vcd");
    $dumpvars(0,test);

    #5 begin a = 4'b1111; b = 4'b1100; end
    #5 begin a = 4'b1111; b = 4'b1111; end
    #5 begin a = 4'b0000; b = 4'b1111; end
    #5 $finish;
end

always @(a,b)
$strobe("At time = (%0t),a = (%b),b = (%b),l = (%b),e = (%b),g = (%b)",$time,a,b,l,e,g);

endmodule