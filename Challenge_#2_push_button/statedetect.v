`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:15:03 05/02/2023 
// Design Name: 
// Module Name:    sd 
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
`timescale 1ns / 1ps

/* module statedetect(result_on,result_off,result_err,result_open,result_buzz,clk_50MHz,state);
input result_on,result_off,result_err,result_open,result_buzz,clk_50MHz; */



module statedetect(clk,s1_err,s2_off,s3_on,s4_open,state);
input clk,s1_err,s2_off,s3_on,s4_open;

output reg [2:0] state;
//output reg buzzer;
//reg [27:0] temp;

always@(posedge clk)
begin

   if(s1_err)
     state=3'b000;
   else if (s2_off)
	  state=3'b001;
	else if (s3_on)
	  state=3'b010;
	else if (s4_open)
	  state=3'b011;

end
endmodule 
