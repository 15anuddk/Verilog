module d_ff_tb();
//Input
reg clk, rst, D;
//output
wire Q;

//initialise
d_ff uut(
    .clk(clk),
    .rst(rst),
    .D(D),
    .Q(Q)
);

always #5 clk = ~clk;
initial begin

    $monitor("time %t , D = %b , Q= %b ", $time, D, Q);
  clk = 0;
  rst = 0;
  D=0;
 
    // Apply test cases
    #10 D = 1;  // Set D = 1
    #10 rst = 1; // Assert reset
    #10 rst = 0; // Deassert reset
    #10 D = 0;  // Change D to 0
 #10 $finish;
end
endmodule