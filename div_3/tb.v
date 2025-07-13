module tb();

reg clk, reset;
reg n;
wire out;

three uut(
    .clk(clk),
    .reset(reset),
    .bit(n),
    .out(out)
);

always #5 clk = ~clk;

reg exp;

initial begin
  $dumpfile("test.vcd");
  $dumpvars(0, tb);

  clk = 0;
  reset = 1;
  n = 0;         // Initialize input
  #10 reset = 0;

  // Test 1
  #10 n = 1;
  #10 n = 1;
  #10;
  exp = 1;
  #1;
  if (out == exp)
    $display("PASS: out = %b, expected = %b", out, exp);
  else
    $display("FAIL: out = %b, expected = %b", out, exp);

  // Reset before next test
  reset = 1;
  n = 0;
  #10 reset = 0;

  // Test 2
  #10 n = 0;
  #10 n = 1;
  #10 n = 1;
  #10 n = 0;
  #10
  exp = 1;
  #10
  if (out == exp)
    $display("PASS: out = %b, expected = %b", out, exp);
  else
    $display("FAIL: out = %b, expected = %b", out, exp);

  #10 $finish;
end

endmodule
