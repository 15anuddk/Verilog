module tb();

reg clk, reset;
wire [7:0] out;

counter uut(.clk(clk), .reset(reset), .out(out));

always #5 clk = ~clk;
initial begin
  clk = 0;
  reset = 1;
  #10 reset = 0;

  #500 $finish;
end

endmodule