module and_gate(a,b,y);
input a,b;
output y;
wire a,b;
and g1(y,a,b);
endmodule

module test;
wire y;
reg a=1'b0,b=1'b0;
initial 
begin
    $dumpfile("and_gate_test.vcd");
    $dumpvars(0,test);
    
    #5  a = 1'b0;b = 1'b0; 
    #5 a = 1'b0;b = 1'b1; 
    #5  a = 1'b1;b = 1'b0; 
    #5  a = 1'b1;b = 1'b1; 
    #5 $finish;
end

and_gate a1(a,b,y);

initial
   $monitor("At time=%t,a=(%0d),b=(%0d),value=%h (%0d)",$time,a,b,y,y); 

endmodule