module Comparador (output logic res);

    reg clk, rst;
    reg [7:0] d_in=8'd200;
    wire tick;
    wire [7:0] q;
     
    timer t0(
        .clk(clk), 
        .rst(rst), 
        .d_in(d_in),
        .q(q),
        .tick(tick)
    );

	assign res= (q==0)? 1'b1:1'b0;



endmodule