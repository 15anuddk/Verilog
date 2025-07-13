module tb();

reg sys_clk, p_clk, q_clk;
wire PeqQ, PleQ, PgrQ;

des uut (.sys_clk(sys_clk),
            .p_clk(p_clk),
            .q_clk(q_clk),
            .PeqQ(PeqQ),
            .PleQ(PleQ),
            .PgrQ(PgrQ)
            );


always #5 sys_clk = ~sys_clk;

always #10 p_clk = ~p_clk;

always #10 q_clk = ~q_clk;

initial begin
  $dumpfile("test.vcd");
  $dumpvars(0, tb);

  sys_clk = 0;

  p_clk = 0;

  q_clk = 1;


  #500

  $finish;
end
endmodule