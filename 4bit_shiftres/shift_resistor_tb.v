module shift_resistor_tb();
//input
reg clk,rst, D;
wire Q;

//initialise
shift_resistor uut(
    .clk(clk),
    .rst(rst),
    .D(D),
    .Q(Q)
);

always #5 clk = ~clk;

initial begin

 $monitor("Time=%t | D=%b | Q=%b", $time, D, Q);
  $dumpfile("test.vcd");
 $dumpvars(0,shift_resistor_tb);
  clk =0;
  rst = 0;
  #10 rst =1; 
  #10 D =0; // initialising D
  #10 rst =0; 
  #10 D = 1;
        #10 D = 0;
        #10 D = 1;
        #10 D = 1;
        #10 D = 0;
        #10 D = 1;
        #10 D = 0;

  #50 $finish;
end
endmodule