`include "ven_machine.v"
module ven_machine_test;
    reg clk;
    reg [1:0] in;
    reg rst;
    wire out;
    wire [1:0] change;
    
    ven_machine uut(.clk(clk), .rst(rst), .in(in), .out(out), .change(change));
    
    initial begin
        $dumpfile("ven_machine.vcd");
        $dumpvars(0, ven_machine_test);
        $monitor("Time=%0t rst=%b in=%b state=%b out=%b change=%b", 
                 $time, rst, in, uut.c_state, out, change);
        
        clk = 0;
        rst = 1;
        in = 0;
        
        #10 rst = 0;
        #10 in = 2'b01;
        #10 in = 2'b01;
        #10 in = 2'b01;
        #10 in = 2'b10;
        #10 in = 2'b10;
        #10 in = 2'b00;
        #20 $finish;
    end
    
    always #5 clk = ~clk;
endmodule
