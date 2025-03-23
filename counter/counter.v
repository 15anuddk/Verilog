module counter(
    input clk, rst, e,
    output wire A0, A1, A2, A3
);
wire y;
assign y = A3 & A1;

d_ff ff_0(.clk(clk & e), .rst(y|rst), .D(~A0), .Q(A0));
d_ff ff_1(.clk(~A0 & e), .rst(y|rst), .D(~A1), .Q(A1));
d_ff ff_2(.clk(~A1 & e), .rst(y|rst), .D(~A2), .Q(A2));
d_ff ff_3(.clk(~A2 & e), .rst(y|rst), .D(~A3), .Q(A3));



endmodule