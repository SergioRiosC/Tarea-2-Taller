module registroEstado(input clk,rst,input[7:0] registro);

reg [7:0] mem;
always@(registro)begin
	mem=registro;
end
endmodule