module gates(a,b,not_op,and_op,nand_op,or_op,nor_op,xor_op,xnor_op);
input a,b;
output not_op,and_op,nand_op,or_op,nor_op,xor_op,xnor_op;

assign not_op = ~(a);
assign and_op = a&b;
assign nand_op = ~(a&b);
assign or_op = a|b;
assign nor_op = ~(a|b);
assign xor_op = a^b;
assign xnor_op = ~(a^b);
endmodule

module test;
wire not_op,and_op,nand_op,or_op,nor_op,xor_op,xnor_op;
reg a=1'b0,b=1'b0;

gates g1(a,b,not_op,and_op,nand_op,or_op,nor_op,xor_op,xnor_op);

initial 
begin
    $dumpfile("1_logicgates_test.vcd");
    $dumpvars(0,test);
    
    #5  begin a = 1'b0;b = 1'b1; end
    #5  begin a = 1'b1;b = 1'b0; end
    #5  begin a = 1'b1;b = 1'b1; end
    #5 $finish;
end

always @(a or b)
   $strobe("At time=(%0t),a=(%0d),b=(%0d)",$time,a,b); 

endmodule