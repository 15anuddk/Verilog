module three(
  input clk,
  input reset,
  input bit,
  output out
);

parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;
reg [1:0] state, n_state;
always @(*) begin
  case (state)
    S0: n_state = (bit) ? S1 : S0;
    S1: n_state = (bit) ? S0 : S2;
    S2: n_state = (bit) ? S2 : S1;
    default :  n_state = S0;
  endcase
end

always @(posedge clk) begin
  if(reset) state <= S0;
  else state <= n_state;
end

assign out = (state == S0);

endmodule