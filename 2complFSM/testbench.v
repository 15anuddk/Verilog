module FSM_tb();

reg a;
reg clk;
reg reset;
wire y;

FSM uut(.a(a), .y(y), .clk(clk), .reset(reset));

always #5 clk = ~clk;

initial begin

$monitor("x= %b , y = %b", a, y);
$dumpfile("test.vcd");
$dumpvars(0, FSM_tb);
  clk = 0;
  reset = 1;
  #10 reset = 0;

  a = 0; #10;
  a = 0; #10;
  a = 0; #10;
  a = 1; #10;
  a = 1; #10;

  reset = 1; #10;
  reset = 0; #10;

  a = 0; #10;
  a = 1; #10;
  a = 0; #10;
  a = 1; #10;
  a = 0; #10;
  a = 1; #10;

$finish;

end

endmodule