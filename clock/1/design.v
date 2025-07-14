// Code your design here
module circuit(
  input clk,
  input reset,
  output reg out);

  reg q;
  
  always @(posedge clk) begin
    if(reset) q<= 0;
    else q <= ~q;
  end
  
  always @(*) begin
    out <= clk & q;
  end
  
endmodule
    