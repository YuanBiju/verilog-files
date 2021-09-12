module fulladder(abc,sum,carry);
input [2:0]abc;
output sum,carry;
reg sum,carry;

always @(abc)
begin
    case(abc)
    3'd0: begin sum = 1'b0; carry = 1'b0; end
    3'd1: begin sum = 1'b1; carry = 1'b0; end
    3'd2: begin sum = 1'b1; carry = 1'b0; end
    3'd3: begin sum = 1'b0; carry = 1'b1; end
    3'd4: begin sum = 1'b1; carry = 1'b0; end
    3'd5: begin sum = 1'b0; carry = 1'b1; end
    3'd6: begin sum = 1'b0; carry = 1'b1; end
    3'd7: begin sum = 1'b1; carry = 1'b1; end
    default: begin end
    endcase
end
endmodule

module test;
wire sum,carry;
reg [2:0]abc;

fulladder f1(abc,sum,carry);

initial 
begin
    $dumpfile("3_full_adder.vcd");
    $dumpvars(0,test);

    #5 abc = 3'd0;
    #5 abc = 3'd1;
    #5 abc = 3'd2;
    #5 abc = 3'd3;
    #5 abc = 3'd4;
    #5 abc = 3'd5;
    #5 abc = 3'd6;
    #5 abc = 3'd7;
    #5 $finish;

end

always @(abc)
$strobe("At time = (%0t),abc = (%b),sum = (%b),carry = (%b)",$time,abc,sum,carry);

endmodule