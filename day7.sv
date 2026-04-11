// Code your testbench here
// or browse Examples
module day7_subroutines;

  logic serial_out;

  // 1. Function: Must be zero-time, returns a value
  function bit calculate_parity(logic [7:0] data);
    return ^data; // XOR reduction for even parity
  endfunction

  // 2. Task: Can consume time (#), cannot return a value directly
  task drive_serial(logic [7:0] data);
    bit parity;
    parity = calculate_parity(data); // Task calling a Function (Valid)
    
    $display("Time: %0t, Starting Serial Drive...", $time);
    for (int i=0; i<8; i++) begin
      serial_out = data[i];
      #10; // Wait 10ns per bit
    end
    serial_out = parity;
    #10;
    $display("Time: %0t | Drive Complete!", $time);
  endtask

  initial begin
    drive_serial(8'hAA); // Calling a task
  end
endmodule
