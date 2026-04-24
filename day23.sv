class Packet;
  rand byte length;
  rand bit [7:0] payload [];
  // 1. Define the "Normal" rule
  constraint legal_length {
    length inside {[1:64]};
  }
  function void post_randomize();
    payload = new[length]; // Resize array based on random length
  endfunction
  function void display(string label);
    $display("Time: %0t, [%s] Length: %0d", $time, label, length);
  endfunction
endclass
module day23_constraint_mode;
  Packet pkt;
  initial begin
    pkt = new();
    // 2. Normal Randomization (Rule is ON)
    pkt.randomize();
    pkt.display("NORMAL");
    // 3. Disable the constraint to allow "Illegal" values
    pkt.legal_length.constraint_mode(0); // 0 = OFF, 1 = ON    
    // Now we can use an inline constraint to pick a huge value
    if (pkt.randomize() with {length == 200;}) begin
      pkt.display("NEGATIVE TEST");
    end
    // 4. Re-enable it for the next sequence
    pkt.legal_length.constraint_mode(1);
    pkt.randomize();
    pkt.display("RESTORED");
  end
endmodule
