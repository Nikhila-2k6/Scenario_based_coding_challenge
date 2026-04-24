typedef enum {READ, WRITE, RESET, NOP} cmd_t;
class CachePacket;
  rand cmd_t cmd;
  rand int   addr;
  // 1. Distribution for Commands
  // := assigns the weight to every item in the list
  constraint cmd_dist {
    cmd dist {
      READ  := 70, // 70% probability
      WRITE := 20, // 20% probability
      RESET := 5,  // 5% probability
      NOP   := 5   // 5% probability
    };
  }
  // 2. Distribution for Addresses using Weight Ranges  and  :/ divides the weight equally among all values in the range
  constraint addr_dist {
    addr dist {
      [0:100]    :/ 80, // The whole range [0:100] shares 80% weight
      [101:1000] :/ 20  // The rest of the space shares 20% weight
    };
  }
  function void display();
    $display("Time: %0t, Command: %s, Addr: %0d", $time, cmd.name(), addr);
  endfunction
endclass
module day24_distribution;
  CachePacket pkt;
  initial begin
    pkt = new();
    repeat (10) begin
      void'(pkt.randomize());
      pkt.display();
    end
  end
endmodule
