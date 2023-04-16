`timescale 1ns / 1ps

module tb;

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
      clk = 1'b0; 
    end

always #5 clk = ~ clk;  

initial begin

        #12 button = 0;#10 button = 0 ; #10 button = 1 ; #10 button = 0 ;
        #12 button = 1;#10 button = 1 ; #10 button = 0 ; #10 button = 1 ;
        #12 button = 1;#10 button = 0 ; #10 button = 0 ; #10 button = 1 ;
        #12 button = 0;#10 button = 1 ; #10 button = 1 ; #10 button = 0 ;
        #10 $finish;
    end
  
endmodule
