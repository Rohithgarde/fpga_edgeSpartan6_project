`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:15:21 06/05/2023 
// Design Name: 
// Module Name:    extra 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module extra(input eclk, output reg eout
    );

always @ (eclk)
begin
case (eclk)
1'b1 : eout <= 1'b1;
1'b0 : eout <= 1'b0;
endcase
end



endmodule



