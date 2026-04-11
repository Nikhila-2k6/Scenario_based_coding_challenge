module day4_queues;
  // Syntax: [type] name [$];
  int scoreboard_q [$]; 
  int data; 
  initial begin
    //  Adding data (Pushing to the back)
    scoreboard_q.push_back(32'hA1A1);
    scoreboard_q.push_back(32'hB2B2);
    scoreboard_q.push_back(32'hC3C3);
    $display("Time: %0t , Queue after pushes: %p", $time, scoreboard_q);
    //  Peek at the front without removing
    $display("Time: %0t , Front element is: 0x%h", $time, scoreboard_q[0]);
    //  Inserting in the middle (at Index 1)
    scoreboard_q.insert(1, 32'hEEEE); 
    $display("Time: %0t , After insertion at index 1: %p", $time, scoreboard_q);
    //  Removing data (Popping from the front - FIFO style)
    data = scoreboard_q.pop_front();
    $display("Time: %0t , Popped: 0x%h | Remaining: %p", $time, data, scoreboard_q);
    //  Deleting a specific index
    scoreboard_q.delete(1); // Deletes the current 2nd element
    $display("Time: %0t , Final Queue state: %p", $time, scoreboard_q);  
    //  Check size
    $display("Time: %0t , Final Size: %0d", $time, scoreboard_q.size());
  end
endmodule
