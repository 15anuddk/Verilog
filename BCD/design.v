//BCD counter 1 to 100
module counter(
    input clk,
    input reset,
    output reg [7:0] out
);

reg [3:0] units, twos;
always @(posedge clk) begin
  if(reset) begin
    units <= 0;
    twos <= 0;
  end
  else begin
    if(units == 9) begin
      units <= 0;
      twos <= twos + 1;
    end
    else begin
      units <= units + 1;
    end
    if(twos == 9) twos <= 0;
  end
  out <= {twos,units};
 $strobe("number %b", out);
end

endmodule