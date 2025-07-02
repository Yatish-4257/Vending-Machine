`include "ven_machine.v"
module ven_machine_test;

reg clk;
reg [1:0]in;
reg rst;

wire out;
wire [1:0]change;

ven_machine uut(.clk(clk), .rst(rst), .in(in), .out(out), .change(change));

initial begin
    $dumpfile("ven_machine.vcd");
    $dumpvars(0, ven_machine_test);
    rst = 1;
    clk = 0;

    #6 rst = 0; in = 1;
    #11 in = 1;
    #16 in = 1;
    #25 $finish;
    end

    always #5 clk = ~clk;

endmodule
