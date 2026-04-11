// Code your testbench here
// or browse Examples
module day1_challenge;
  bit [7:0] data_bus_a;   // 2-state type
  logic [7:0] data_bus_b; // 4-state type

  initial begin
    // Scenario: The hardware drives an 'X' (Unknown) due to a reset issue
    force data_bus_b = 8'bxxxx_xxxx;
    data_bus_a = data_bus_b;

    $display("Time: %0t | Data_B (Logic): %b", $time, data_bus_b);
    $display("Time: %0t | Data_A (Bit)  : %b", $time, data_bus_a);
    
    if (data_bus_a == 0) 
      $display("Result: Data_A defaulted to 0. No 'X' detected!");
  end
endmodule
