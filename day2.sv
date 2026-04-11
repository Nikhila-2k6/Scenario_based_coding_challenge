// Code your testbench here
// or browse Examples
module day2_dynamic_arrays;
  // Declare a dynamic array (empty brackets [])
  byte data_packet [];

  initial begin
    // Allocate memory for a small 4-byte header
    data_packet = new[4];
    data_packet = '{8'hAA, 8'hBB, 8'hCC, 8'hDD};
    $display("Time: %0t | Size: %0d | Data: %p", $time, data_packet.size(), data_packet);

    // Resize to 6 bytes while KEEPING the original data
    data_packet = new[6](data_packet); 
    data_packet[4] = 8'hEE;
    data_packet[5] = 8'hFF;
    $display("Time: %0t | Resized: %0d | Data: %p", $time, data_packet.size(), data_packet);

    // Clear memory
    //data_packet.delete();
    $display("Time: %0t | Final Size: %0d", $time, data_packet.size());
  end
endmodule
