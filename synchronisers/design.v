module des(
    input sys_clk,
    input p_clk,
    input q_clk,
    output PeqQ,
    output PleQ,
    output PgrQ
);

reg p_sync, q_sync;
reg p_sync2, q_sync2;
reg p_sync3, q_sync3;
reg p_rise, q_rise;

// Edge detection
always @(posedge sys_clk) begin
  p_sync  <= p_clk;
  p_sync2 <= p_sync;
  p_sync3 <= p_sync2;
  p_rise  <= ~p_sync3 & p_sync2;

  q_sync  <= q_clk;
  q_sync2 <= q_sync;
  q_sync3 <= q_sync2;
  q_rise  <= ~q_sync3 & q_sync2;
end

// Period counters
reg [7:0] period_p = 0;
reg [7:0] period_q = 0;

always @(posedge sys_clk) begin
  if (p_rise)
    period_p <= 0;
  else
    period_p <= period_p + 1;

  if (q_rise)
    period_q <= 0;
  else
    period_q <= period_q + 1;
end

// Output comparison
assign PeqQ = (period_p == period_q);
assign PgrQ = (period_p >  period_q);
assign PleQ = (period_p <  period_q);

endmodule
