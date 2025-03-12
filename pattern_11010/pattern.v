module pattern(
  input wire clk, reset, in,
  output reg detected);
  
  localparam S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100;
  
  reg[2:0] state, state_next;
  
  always @(posedge clk) begin
    if(reset)
      state <= S0;
    else
      state <= state_next;
  end
  
  always @(*) begin
    case(state)
      S0: state_next = in ? S1:S0;
      S1: state_next = in ? S2:S0;
      S2: state_next = in ? S2:S3;
      S3: state_next = in ? S4:S0;
      S4: state_next = in ? S2:S0;
      default: state_next = 0;
      
    endcase
    detected = (state ==S4 && in ==0) ? 1'b1:1'b0;
  end
  
endmodule
  
  
  
