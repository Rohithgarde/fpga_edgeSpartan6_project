`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:08:50 05/02/2023 
// Design Name: 
// Module Name:    superdisplay 
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
module superdisplay(
    input err,
    input off,
    input on,
    input open,
    input sound,
	 input clk,
	 output [3:0] digit,
    output [7:0] seg,
    output buzzer
    );

	 wire [2:0]state;

wire w_result_err, w_result_off, w_result_on, w_result_open,w_result_buzzer;

debouncer db(.err(err), .off(off), .on(on), .open(open), .clk(clk), .sound(sound),
/*.reset(reset),*/ .result_err(w_result_err), .result_off(w_result_off), .result_on(w_result_on), .result_open(w_result_open), .result_buzzer(w_result_buzzer));//.result_buzzer(w_result_buzzer)


statedetect s1 (.clk(clk),.s1_err(w_result_err),.s2_off(w_result_off),.s3_on(w_result_on),.s4_open(w_result_open),.state(state)); //
	
segment s2 (.clk(clk),.state(state),.buzz(w_result_buzzer),.buzzer(buzzer),.seg(seg),.digit(digit));

endmodule
