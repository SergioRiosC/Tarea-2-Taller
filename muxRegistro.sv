module muxRegistro (
  input [7:0] registro,
  input selector,
  output reg [7:0] resultado
);
  reg clk, rst;

  always_comb begin
    if (selector)
      resultado = registro;
    else
      resultado = 8'bx;
  end

  registroEstado regEstado (.clk(clk), .rst(rst), .registro(resultado));

endmodule
