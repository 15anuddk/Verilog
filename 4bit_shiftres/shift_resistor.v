`include "d_ff.v"
module shift_resistor(
    input clk, rst, D,
    output Q
);

wire s0, s1, s2, s3;
d_ff ff3(.clk(clk), .rst(rst), .D(D), .Q(s3));
d_ff ff2(.clk(clk), .rst(rst), .D(s3), .Q(s2));
d_ff ff1(.clk(clk), .rst(rst), .D(s2), .Q(s1));
d_ff ff0(.clk(clk), .rst(rst), .D(s1), .Q(s0));

assign Q = s0;
endmodule