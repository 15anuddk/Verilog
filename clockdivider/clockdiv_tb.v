module clockdiv_tb();
//Input
reg clk_in;
reg rst;
//output
wire clk_out;

clockdiv uut(
    .clk_in(clk_in),
    .rst(rst),
    .clk_out(clk_out)
);

always #10 clk_in = ~clk_in;

initial begin
 $dumpfile("test.vcd");
 $dumpvars(0,clockdiv_tb);
  clk_in =0;
  rst = 1;
  #50 rst =0;
  
  #500;
  $stop;
end

endmodule