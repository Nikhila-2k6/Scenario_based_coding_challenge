
module day3_associative_arrays;
  // Syntax: [data_type] array_name [index_type];
  int memory_map [int unsigned]; // Sparse memory indexed by 32-bit addr

  initial begin
    // 1. Writing to non-contiguous locations
    memory_map[32'h0000_1000] = 32'hDEAD_BEEF;
    memory_map[32'hAAAA_5555] = 32'hCAFE_BABE;
    memory_map[32'hFFFF_FFFC] = 32'h1234_5678;

    // 2. Checking if an address exists using .exists()
    if (memory_map.exists(32'h0000_0000))
       $display("Addr 0 found!");
    else
       $display("Addr 0 is empty (No memory leaked!)");

    // 3. Traversal using .first and .next
    //Unlike a standard array where you know the indices are $0, 1, 2, ...$, an associative array is sparse. The indices (addresses) could be anything ($0x1000$, $0xAAAA$, etc.). You can't use a simple for loop because you don't know what the next valid address is.
    begin
      int unsigned addr;
      if (memory_map.first(addr)) begin
        do begin
          $display("Address: 0x%0h | Data: 0x%0h", addr, memory_map[addr]);
        end while (memory_map.next(addr));
      end
    end
    
    $display("Total entries in sparse memory: %0d", memory_map.num());
  end
endmodule
