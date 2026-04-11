module day10_control_flow;
  logic [2:0] request;
  initial begin
    // 1. UNIQUE Case: Checks that ONLY ONE condition matches
    // Simulator will trigger a warning if multiple bits in 'request' are high
    request = 3'b010;  
    unique case (request)
      3'b001 : $display("Time: %0t | Mode: Idle", $time);
      3'b010 : $display("Time: %0t | Mode: Active", $time);
      3'b100 : $display("Time: %0t | Mode: Error", $time);
      // No default needed if all cases are covered; 
      // 'unique' will warn if an undefined value occurs.
    endcase
    // 2. PRIORITY Case: Checks conditions in order, but warns if NO match is found
    request = 3'b111; // Multiple bits high
    priority case (1'b1)
      request[2] : $display("Time: %0t, Priority: High (Error)", $time);
      request[1] : $display("Time: %0t, Priority: Medium (Active)", $time);
      request[0] : $display("Time: %0t, Priority: Low (Idle)", $time);
    endcase
    // 3. Foreach Loop: The cleanest way to iterate over arrays
    begin
      int simple_array[4] = '{10, 20, 30, 40};
      foreach (simple_array[i]) begin
        $display("Index %0d has value %0d", i, simple_array[i]);
      end
    end
  end
endmodule
