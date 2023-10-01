module registroMant (input clk,rst, mant, output reg [7:0] resultado);

always @(mant)begin

if(mant)
	resultado= resultado+8'b00000001;
end
endmodule