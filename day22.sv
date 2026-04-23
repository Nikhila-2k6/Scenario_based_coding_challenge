class MemoryPacket;
  rand bit [15:0] addr;
  rand bit [31:0] data;
  // 1. Simple Range Constraint
  constraint valid_addr_range {
    addr >= 128;
    addr <= 959;
  }
  // 2. Set-Based Constraint (Inside)
  // Ensures data is never 0 and avoids specific 'bad' values
  constraint safe_data {
    data > 0;
    !(data inside {32'hFFFF_FFFF, 32'h0000_CAFE});
  }
  function void display();
    $display("Time: %0t, Addr: %0d, Data: 0x%h", $time, addr, data);
  endfunction
endclass
module day22_constraints;
  MemoryPacket pkt;
  initial begin
    pkt = new();
    repeat (5) begin
      if (!pkt.randomize()) begin
        $error("Randomization Failed! Constraints are conflicting.");
      end else begin
        pkt.display();
      end
    end
  end
endmodule
