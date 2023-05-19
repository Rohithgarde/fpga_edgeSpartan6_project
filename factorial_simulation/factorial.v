
module factorial(
  input [31:0] n,
  output reg [31:0] result
);
reg [31:0] i;
//assign  result = 1;
  always @ (n) 
  begin
  result=1;
   for (i = 1; i <= n; i = i + 1) 
	 begin
      result = result * i;
    end
  end

endmodule

