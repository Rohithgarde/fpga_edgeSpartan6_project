`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:04:39 05/25/2023 
// Design Name: 
// Module Name:    top 
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

module TOP(
    input clkin,         	 
    input rb,
	 input a,
	 input b,
	 input c,
    input d,	           
	 output bzin);
wire clk_a;
wire clk_b;
wire clk_c;
wire clk_d;
wire a_o;
wire b_o;
wire c_o;
wire d_o;
wire [1:0] state;
wire ewire;


clk261hz aq(.clk_50MHz(clkin), .reset_button(rb), .clk_0(clk_a));
clk329hz bq(.clk_50MHz(clkin), .reset_button(rb), .clk_4(clk_b));
clk415hz cq(.clk_50MHz(clkin), .reset_button(rb), .clk_8(clk_c));
clk523hz dq(.clk_50MHz(clkin), .reset_button(rb), .clk_12(clk_d));

debouncer dd1(.c4(a),.e4(b),.ab4(c),.c5(d),.clk_50MHz(clkin),.result_c4(a_o),.result_e4(b_o),
	.result_ab4(c_o),.result_c5(d_o));
	
statedetect sd(.result_c4(a_o),.result_e4(b_o),.clk_50MHz(clkin),.state(state),.result_ab4(c_o),.result_c5(d_o));

m41 mux(.c4(clk_a), .e4(clk_b), .ab4(clk_c), .c5(clk_d), .state(state), .out(ewire));

extra ex(.eclk(ewire),.eout(bzin));

endmodule
