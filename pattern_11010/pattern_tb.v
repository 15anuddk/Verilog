module pattern_tb();
  //Input
  reg clk,reset,in;
  wire detected;
  
  pattern uut(
    .in(in),
    .clk(clk),
    .reset(reset),
    .detected(detected));
  
  always #5 clk = ~clk;
  initial begin
    // Apply test pattern: "11010" → Should detect at last 0
    $monitor("Time = %0t | in = %b | State = %b | detected = %b", $time, in, uut.state, detected);
    reset = 1;
    clk = 0;
    in =0;
    #10 reset = 0;
    
    #10 in = 1;
    #10 in = 1;
    #10 in = 0;
    #10 in = 1;
    #10 in = 0;  // Detected should be HIGH here
    
    // Add some extra bits to check behavior
    #10 in = 1;
    #10 in = 1;
    #10 in = 0;
    #10 in = 1;
    #10 in = 1;
    #10 in = 0;
    #10 in = 1;
    #10 in = 0;  // Should detect again here
    
    #20 $finish; // End simulation
  end
endmodule

    
