`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:40:54 05/02/2023 
// Design Name: 
// Module Name:    sevenseg 
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

module segment(
    input clk,
  //  input reset_button,
 // input [7:0] bcd,
input [2:0] state,

input buzz,



	 
	 output reg buzzer,
    output reg [7:0] seg,       // segment pattern 0-9
    output reg [3:0] digit      // digit select signals
    );// Parameters for segment patterns
    parameter E  = 8'b01100001;
    parameter r  = 8'b11110101;
    parameter O = 8'b00000011;
    parameter P= 8'b00110001;
    parameter F  = 8'b01110001;
    parameter n =8'b00010011;
	 parameter letter = 8'b11111111;
	 // To select each digit in turn
	 reg [27:0] temp;
    reg [1:0] digit_select;     // 2 bit counter for selecting each of 4 digits
    reg [16:0] digit_timer;     // counter for digit refresh
    
    // Logic for controlling digit select and digit timer
    always @(posedge clk ) begin
		    if(digit_timer == 49_999) begin         // The period of 50MHz clock is 20ns (1/(50*1,000,000) seconds)
                digit_timer <= 0;                   // 20ns x 50,000 = 1ms
                digit_select <=  digit_select + 1;
            end
            else
                digit_timer <=  digit_timer + 1;
    end
    
    // Logic for driving the 4 bit anode output based on digit select
    always @(digit_select) begin
	   case(digit_select) 
            2'b00 : digit = 4'b0001;   // Turn on ones digit
            2'b01 : digit = 4'b0010;   // Turn on tens digit
            2'b10 : digit = 4'b0100;   // Turn on hundreds digit
            2'b11 : digit = 4'b1000;   // Turn on thousands digit
        endcase
    end
	   // Logic for driving segments based on which digit is selected and the value of each digit
    always @(posedge clk) begin
	 if(buzz==1) begin
	 buzzer =1'b1;
	 temp = 100000000;
	 end

	 else if(temp>0)
	begin
	  temp = temp - 1;
	  if(temp == 0)
	    buzzer =1'b0;
	end
	
		
		 
        case(digit_select)
            2'b00 : begin       // ONES DIGIT
				case(state)
//			             3'b000 :  seg = letter;
//							 3'b001  : seg= r;
//							 3'b010 :  seg = F;
//							 3'b011  : seg= n;  //*/
//							3'b100 : seg = letter; 
							3'b000: seg = r;
							3'b010: seg = letter;
							3'b001: seg = F;
							3'b011: seg = n;
                        endcase
				end
				
	
									 
                    
                    
            2'b01 : begin       // TENS DIGIT
				
			
                  case(state)
//			             3'b000 :  seg = n;
//							 3'b001  : seg= r;
//							 3'b010 :  seg = F;
//							 3'b011  : seg= E;  //*/
//							3'b100 : seg = letter; // seg <= letter;
							3'b000: seg = r;
							3'b010: seg = n;
							3'b001: seg = F;
							3'b011: seg = E;
                        endcase

  
									 
									 
                    end
           2'b10 : begin       // HUNDREDS DIGIT
			  
			   case(state)
				3'b000: seg = E;
				3'b010: seg = O;
				3'b001: seg = O;
				3'b011: seg = P;
//			             3'b000 :  seg = O;
//							 3'b001  : seg= E;
//							 3'b010 :  seg = O;
//							 3'b011  : seg= P;  //*/
//							3'b100 : seg = letter; // seg <= letter; 
                        endcase
 		
									
                    end
									  
                    
                    
             2'b11 : begin       // MINUTES ONES DIGIT
 			         case(state)
						3'b000: seg = letter;
						3'b010: seg = letter;
						3'b001: seg = letter;
						3'b011: seg = O;
//			             3'b000 :  seg = letter;
//							 3'b001  : seg= letter;
//							 3'b010 :  seg = letter;
//							 3'b011  : seg= O;  //*/
//							3'b100 : seg = letter; // seg <= letter; 
                        endcase 

				
				end
				
        endcase
               end             
									  
      
endmodule

