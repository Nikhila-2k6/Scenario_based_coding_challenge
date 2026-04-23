// Code your testbench here
// or browse Examples
class InterruptPacket;
  // 1. 'rand': Standard random. Can repeat values.
  rand  bit [2:0] channel_id; 
  // 2. 'randc': Cyclic random. Permutes all values before repeating.
  randc bit [2:0] cyclic_id;
  function void display();
    $display("Time: %0t, rand: %0d, randc: %0d", $time, channel_id, cyclic_id);
  endfunction
endclass

module day21_randomization;
  InterruptPacket pkt;
  initial begin
    pkt = new();
    repeat (10) begin
      // 3. The .randomize() method: This is where the magic happens!
      if (!pkt.randomize()) begin
        $error("Randomization failed!");
      end
      pkt.display();
    end
  end
endmodule
