module counter_tb();
//input 
reg clk, rst, e;

//output 
wire A0, A1, A2, A3;

counter uut(
    .clk(clk),
    .rst(rst),
    .A0(A0),
    .A1(A1),
    .A2(A2),
    .A3(A3),
    .e(e)
);
always #5 clk = ~clk;

initial begin
  $monitor("time= %t  A3 = %b  A2 = %b  A1= %b  A0 = %b", $time, A3, A2, A1, A0);
  $dumpfile("test.vcd");
  $dumpvars(0, counter_tb);

  clk = 0;
  rst = 1;
    e= 1;
  #10 rst = 0;

  #500;
  e=0;
  $finish;
end

endmodule


