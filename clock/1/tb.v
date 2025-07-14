// Code your testbench here
// or browse Examples
module test_tb();
  
  reg clk, reset;
  wire out;

  circuit uut(.clk(clk),
              .reset(reset),
              .out(out));
  
  always #5 clk = ~clk;
  
  initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,test_tb);
    
    clk = 0;
    reset = 1;
    #10 reset = 0;
    
    #200
    $finish;
  end
  
endmodule