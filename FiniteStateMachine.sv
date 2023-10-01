module FiniteStateMachine(input logic clk, input logic rst, input logic mButton, output logic y);

logic [1:0] state, next_state;
logic mux_out,cycles;
reg [7:0] registro;
reg [7:0] result;


always_ff @(posedge clk or posedge rst)
	if(rst) 
		state=2'b00;
	else
		state=next_state;

Comparador comp(
	.res(cycles)
	);
registroMant reg0( .clk(clk),.rst(rst), .mant(mux_out), .resultado(registro));	
			
muxRegistro muxReg(.registro(registro),.selector(mux_out),.resultado(result));		
always_comb
	case(state)
		2'b00: 
			if(mButton) 
				next_state=2'b01;
			else 
				next_state=2'b10;
				
		2'b01: 
			next_state=2'b01;
				
		2'b10:
			if(cycles) 
				next_state=2'b11;
			else 
				next_state=2'b00;
			
		2'b11: 
			next_state=2'b11;
			
		default: next_state=2'b00;
	endcase
	
always_ff @(posedge clk or posedge rst)begin
	if(rst) begin
	end
	else begin
		if(state==2'b01)begin
			mux_out<=2'b01;
		end
	end
end
	

//output logic

assign a = (state==2'b01);
assign b = (state==2'b11);

endmodule