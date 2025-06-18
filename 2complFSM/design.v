module FSM(
    input a,
    input clk,
    input reset,
    output reg y
);

reg A, B;
reg A_in, B_in;
always @(posedge clk) begin
  if (reset) begin
    A <= 0;
    B <= 0;
  end else begin  
    A_in = A;
    B_in = B;
    A <= B_in + A_in;
    B <= a;
  end
  
end

always @(posedge clk) begin
 y = (B & (~a)) | (A & (~a)) | (a & (~A) & (~B));
end

endmodule
