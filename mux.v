module m41 (c4, e4, ab4, c5, state, out);
//input clk;
input wire c4, e4, ab4, c5;
input wire [1:0] state;
output reg out;

always @ (state)
begin

case (state)
2'b00 : out <= c4;
2'b01 : out <= e4;
2'b10 : out <= ab4;
2'b11 : out <= c5;
endcase

end

endmodule
