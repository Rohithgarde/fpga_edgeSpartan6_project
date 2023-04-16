`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:35:56 04/16/2023
// Design Name:   debounce_ckt
// Module Name:   /home/rohith/Documents/Debouncing/debouncetb.v
// Project Name:  Debouncing
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: debounce_ckt
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module debouncetb;

	// Inputs
	reg button;
	reg clk;

	// Outputs
	wire result;

	// Instantiate the Unit Under Test (UUT)
	debounce_ckt uut (
		.button(button), 
		.clk(clk), 
		.result(result)
	);

	initial begin
		// Initialize Inputs
		
		button = 0;
		clk = 0;
end
		// Wait 100 ns for global reset to finish
		always #5 clk=~clk;
      always begin  
		// Add stimulus here
		   #10 button=1;
			
		#10 button=0;
		#25 button=1;
		#15 button=0;
		#20 button=0;
		#10 button=1;
		#30 button=0;
		#15 button=1;
		
		
		
		

	end
      
endmodule

