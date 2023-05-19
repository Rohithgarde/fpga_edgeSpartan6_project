module factorial_tb;

  // Instantiate the factorial module
  factorial dut(.n(n), .result(result));

  // Define input and output signals
  reg [31:0] n;
  wire [31:0] result;

  // Apply test vectors
  initial begin
    n = 5;
    #10;
    n = 6;
    #10;
    n = 7;
    #10;
    n = 8;
    #10;
    n = 9;
    #10;
    n = 10;
    #10;
    $finish;
  end

  // Monitor the output signal and compare it with the expected result
  always @ (result) begin
    case (n)
      5: if (result !== 120) $display("Test failed for n=5");
      6: if (result !== 720) $display("Test failed for n=6");
      7: if (result !== 5040) $display("Test failed for n=7");
      8: if (result !== 40320) $display("Test failed for n=8");
      9: if (result !== 362880) $display("Test failed for n=9");
      10: if (result !== 3628800) $display("Test failed for n=10");
      default: $display("Invalid value of n");
    endcase
  end
endmodule
